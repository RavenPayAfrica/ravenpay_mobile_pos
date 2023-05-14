# Raven MPOS (Mobile POS) Flutter Plugin

A Flutter Plugin that enables you connect to [Raven Bank](https://getravenbank.com/) Mobile POS terminal

# Prerequisites

## Credentials

First you need to obtain your app credentials from [here.](https://getravenbank.com)

## Android Setup

### Set minSdkVersion target

This library targets android devices >= SDK 20. Make sure you're targeting at-least the same by modifying your `android/build.gradle` file


> \
> minSdkVersion = 20
>
> \


### Update  `AndroidManifest.xml` to add neccessary permissions and configs


```
 <uses-feature
        android:name="android.hardware.bluetooth_le"
        android:required="true" />
    <uses-feature android:name="android.hardware.usb.host" />

    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    <uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
    <uses-permission android:name="android.permission.WAKE_LOCK" />
    <uses-permission android:name="android.permission.BLUETOOTH" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" /> 
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission
        android:name="android.permission.MOUNT_UNMOUNT_FILESYSTEMS"
        tools:ignore="ProtectedPermissions" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission
        android:name="android.permission.INTERACT_ACROSS_USERS_FULL"
        tools:ignore="ProtectedPermissions" />
    <uses-permission
        android:name="android.permission.INTERACT_ACROSS_USERS"
        tools:ignore="ProtectedPermissions" />

    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.WRITE_CONTACTS" />

    <uses-permission
        android:name="android.permission.HARDWARE_TEST"
        tools:ignore="ProtectedPermissions" />
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission
        android:name="android.permission.INSTALL_PACKAGES"
        tools:ignore="ProtectedPermissions" />
    <uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
```


### Also Add this Activity to your  `AndroidManifest.xml` file

```
 <activity android:name="com.ravenpos.ravendspreadpos.device.RavenActivity"
           android:exported="true">
           <intent-filter>
               <action android:name="android.hardware.usb.action.USB_DEVICE_ATTACHED" />
           </intent-filter>
       </activity>
```


## IOS SETUP (Coming Soon)


## Usage

```dart
    await RavenMobilePOS.launch(context,
                      config: RavenMobilePOSConfig(onSuccess: (data) {
                        print(data);
                      }, onError: (error) {
                        print(error.message);
                      }));
```


