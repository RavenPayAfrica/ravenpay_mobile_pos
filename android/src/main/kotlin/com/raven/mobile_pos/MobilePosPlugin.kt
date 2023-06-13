package com.raven.mobile_pos

import android.Manifest
import android.app.Activity
import android.app.Activity.RESULT_CANCELED
import android.bluetooth.BluetoothAdapter
import android.content.Context
import android.content.Context.LOCATION_SERVICE
import android.content.Intent
import android.content.pm.PackageManager
import android.location.LocationManager
import android.os.Build
import android.provider.Settings
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.ravenpos.ravendspreadpos.BaseApplication
import com.ravenpos.ravendspreadpos.device.RavenActivity
import com.ravenpos.ravendspreadpos.utils.AppLog
import com.ravenpos.ravendspreadpos.utils.Constants
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import java.util.*


/** MobilePosPlugin */
class MobilePosPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private val bluetoothCode = 100
    private val locationCode = 101
    private var lm //【Location management】
            : LocationManager? = null

    private var result: Result? = null
    private var resultStatus: Result? = null

    private var context: Context? = null
    private var activity: Activity? = null


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mobile_pos")
        channel.setMethodCallHandler(this)
        BaseApplication.setContext(context)

    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        this.resultStatus = result
        var arguments: Map<String, Objects> = emptyMap<String, Objects>()

        if (call.arguments != null) {
            arguments = call.arguments as Map<String, Objects>
        }



        when (call.method) {
            "getPosSdkStatus" -> {
                try {
                    val deviceType: Int = arguments.getValue("deviceType") as Int
                    if (deviceType == 1) {
                        val sdkStatus: Boolean = RavenActivity.isUSBDetected()
                        if (sdkStatus) {
                            result.success(sdkStatus)
                        } else {
                            result.error("UNAVAILABLE", "posSDK  not available.", null)
                        }
                    } else {
                        bluetoothRelaPer()
                    }
                } catch (e: Exception) {
                    AppLog.d("getPosSdkStatus", e.message)
                }
            }

            "startTransaction" -> {
                try {
                    val amount: Double = arguments.getValue("amount") as Double
                    val deviceType: Int = arguments.getValue("device_type") as Int
                    this.result = result
                    val intent = Intent(getContext(), RavenActivity::class.java)
                    intent.putExtra(Constants.INTENT_EXTRA_ACCOUNT_TYPE, "10")
                    intent.putExtra(Constants.INTENT_EXTRA_AMOUNT_KEY, amount)
                    intent.putExtra(Constants.TERMINAL_ID, "2030LQ01")
                    intent.putExtra(Constants.INTENT_BLUETOOTH_DEVICE_TYPE, deviceType == 0)

                    intent.putExtra(
                            Constants.INTENT_CLEAR_MASTER_KEY,
                            "549DEC3898977CC243A415DCC1BF6457"
                    )
                    intent.putExtra(
                            Constants.INTENT_CLEAR_PIN_KEY,
                            "9DFB23DC0EE3899B26DFBA372570A151"
                    )

                    intent.putExtra(Constants.INTENT_Port, "5013")
                    intent.putExtra(Constants.INTENT_IP, "196.6.103.18")
                    intent.putExtra(Constants.INTENT_MID, "2030LA0C0199436")
                    intent.putExtra(Constants.INTENT_SN, "98211206905806")
                    intent.putExtra(
                            Constants.INTENT_BUSINESS_NAME_KEY,
                            "RAVENPAY LIMITED       LA           LANG"
                    )
                    intent.putExtra(
                            Constants.INTENT_CLEAR_SESSION_KEY,
                            "97BCC4618F323BF119103E9E161C589E"
                    )

                    if (arguments.containsKey("pin")) {
                        intent.putExtra(Constants.KEY_ID, arguments.getValue("pin") as String)
                    }
                    getActivity().startActivityForResult(intent, 1001)
                } catch (e: Exception) {
                    AppLog.d("startTransaction", e.message)
                }

            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun bluetoothRelaPer() {
        try {
            val adapter = BluetoothAdapter.getDefaultAdapter()
            if (adapter != null && !adapter.isEnabled) {
                //if bluetooth is disabled, add one fix
                val enabler = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
                getActivity().startActivity(enabler)
            }
            lm =
                    getActivity().getSystemService(LOCATION_SERVICE) as LocationManager
            val ok = lm!!.isProviderEnabled(LocationManager.GPS_PROVIDER)
            if (ok) { //Location service is on
                if (ContextCompat.checkSelfPermission(
                                getActivity(),
                                Manifest.permission.ACCESS_FINE_LOCATION
                        )
                        != PackageManager.PERMISSION_GRANTED
                ) {
                    Log.e("POS_SDK", "Permission Denied")
                    // Permission denied
                    // Request authorization
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                        if (ContextCompat.checkSelfPermission(
                                        getActivity(),
                                        Manifest.permission.BLUETOOTH_SCAN
                                ) != PackageManager.PERMISSION_GRANTED || ContextCompat.checkSelfPermission(
                                        getActivity(),
                                        Manifest.permission.BLUETOOTH_CONNECT
                                ) != PackageManager.PERMISSION_GRANTED || ContextCompat.checkSelfPermission(
                                        getActivity(),
                                        Manifest.permission.BLUETOOTH_ADVERTISE
                                ) != PackageManager.PERMISSION_GRANTED
                        ) {
                            val list = arrayOf(
                                    Manifest.permission.ACCESS_FINE_LOCATION,
                                    Manifest.permission.BLUETOOTH_SCAN,
                                    Manifest.permission.BLUETOOTH_CONNECT,
                                    Manifest.permission.BLUETOOTH_ADVERTISE
                            )
                            ActivityCompat.requestPermissions(getActivity(), list, bluetoothCode)
                        }
                    } else {
                        ActivityCompat.requestPermissions(
                                getActivity(),
                                arrayOf(
                                        Manifest.permission.ACCESS_COARSE_LOCATION,
                                        Manifest.permission.ACCESS_FINE_LOCATION
                                ),
                                locationCode
                        )
                    }
                    //                        Toast.makeText(getActivity(), "Permission Denied", Toast.LENGTH_SHORT).show();
                } else {
                    // have permission
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                        if (ContextCompat.checkSelfPermission(
                                        getActivity(),
                                        Manifest.permission.BLUETOOTH_SCAN
                                ) != PackageManager.PERMISSION_GRANTED || ContextCompat.checkSelfPermission(
                                        getActivity(),
                                        Manifest.permission.BLUETOOTH_CONNECT
                                ) != PackageManager.PERMISSION_GRANTED || ContextCompat.checkSelfPermission(
                                        getActivity(),
                                        Manifest.permission.BLUETOOTH_ADVERTISE
                                ) != PackageManager.PERMISSION_GRANTED
                        ) {
                            val list = arrayOf(
                                    Manifest.permission.ACCESS_FINE_LOCATION,
                                    Manifest.permission.BLUETOOTH_SCAN,
                                    Manifest.permission.BLUETOOTH_CONNECT,
                                    Manifest.permission.BLUETOOTH_ADVERTISE
                            )
                            ActivityCompat.requestPermissions(getActivity(), list, bluetoothCode)
                        }
                    }
                    this.resultStatus?.success(true)
                    Toast.makeText(this.activity, "Permission Granted", Toast.LENGTH_SHORT).show()
                }
            } else {
                Log.e("BRG", "System detects that the GPS location service is not turned on")
                Toast.makeText(
                        getActivity(),
                        "System detects that the GPS location service is not turned on",
                        Toast.LENGTH_SHORT
                ).show()
                val intent = Intent()
                intent.action = Settings.ACTION_LOCATION_SOURCE_SETTINGS
                getActivity().startActivityForResult(intent, 1315)
            }
        } catch (e: Exception) {
            AppLog.d("Bluetooth", e.message)
        }

    }


    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        try {
            activity = binding.activity
            binding.addActivityResultListener(this)
        } catch (e: java.lang.Exception) {
            e.printStackTrace()
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
//        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
//        activity = null
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {

        Log.d("ACTIVITY RESULT", "COMPLETE")
        if (resultCode != RESULT_CANCELED) {
            if (requestCode == 1001) {
                if (data != null) {
                    if (data.hasExtra("data")) {
                        val responseData = data.getStringExtra("data")
                        result?.success(responseData)
                        return true;
                    }
                }
            }
        }
        return false
    }

    private fun getContext(): Context {
        return context as Context
    }

    private fun getActivity(): Activity {
        return activity as Activity
    }


}
