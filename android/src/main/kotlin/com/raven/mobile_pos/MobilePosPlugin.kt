package com.raven.mobile_pos

//import android.content.Intent
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import com.ravenpos.ravendspreadpos.device.RavenActivity
import com.ravenpos.ravendspreadpos.utils.Constants
import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
//import java.util.Objects
import java.util.*

/** MobilePosPlugin */
class MobilePosPlugin : FlutterActivity(), FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel



  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mobile_pos")
    channel.setMethodCallHandler(this)


  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    var arguments: Map<String, Objects> = emptyMap<String, Objects>()

    if (call.arguments != null) {
      arguments = call.arguments as Map<String, Objects>
    }

    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getPosSdkStatus") {
      val sdkStatus: Boolean = RavenActivity.isUSBDetected();
      if (sdkStatus) {
        result.success(sdkStatus)
      } else {
        result.error("UNAVAILABLE", "posSDK not available.", null)
      }
    } else if (call.method == "startTransaction") {
      val myMacAddress = RavenActivity.isUSBDetected()
      print("Ayodeji POS MAC =" + { myMacAddress })
      //result.success(myMacAddress)
      val amount: Double = arguments.getValue("amount") as Double
      val accountType: String = arguments.getValue("amount") as String

      val intent = Intent(this, RavenActivity::class.java)
      intent.putExtra(Constants.INTENT_EXTRA_ACCOUNT_TYPE, "10")
      intent.putExtra(Constants.INTENT_EXTRA_AMOUNT_KEY, amount)
      intent.putExtra(Constants.TERMINAL_ID, "2030LQ01")
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
      startActivityForResult(intent, 100)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
