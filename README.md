# Raven MPOS (Mobile POS) Flutter Plugin

A Flutter Plugin that enables you connect to [Raven Bank](https://getravenbank.com/) Mobile POS terminal

# Prerequisites

## Credentials

First you need to obtain your app credentials from [here.](https://getravenbank.com)

## Android Setup

### Set minSdkVersion target

This library targets android devices >= SDK 21. Make sure you're targeting at-least the same by modifying your `android/app/build.gradle` file


> minSdkVersion = 21


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
    <uses-permission android:name="android.permission.INTERNET" />
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


## IOS Setup (Coming Soon)


## Usage

### Import

```dart
import 'package:mobile_pos/mobile_pos_sdk.dart';
```

### Launch SDK

```dart
    await RavenMobilePOS.launch(context,
                      config: RavenMobilePOSConfig(onSuccess: (data) {
                        print(data);
                      }, onError: (error) {
                        print(error.message);
                      }));
```


