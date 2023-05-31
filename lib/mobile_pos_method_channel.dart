import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/helpers/enums.dart';
import 'package:mobile_pos/src/views/home/raven_pay_app.dart';

import 'mobile_pos_platform_interface.dart';

/// An implementation of [MobilePosPlatform] that uses method channels.
class MethodChannelMobilePos extends MobilePosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mobile_pos');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> startRavenPay(BuildContext context) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        settings: const RouteSettings(name: "raven_pay"),
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (_, __, ___) => const RavenPayApp(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );

    return;
  }

  @override
  Future<bool?> checkConnectivityStatus(
      ConnectivityType connectivityType) async {
    var args = <String, dynamic>{
      "deviceType": _getConnectivityCode(connectivityType)
    };
    final status =
        await methodChannel.invokeMethod<bool>('getPosSdkStatus', args);
    return status;
  }

  @override
  Future<String?> chargeCard(
      {required double amount,
      required ConnectivityType connectivityType}) async {
    var args = <String, dynamic>{
      "amount": amount,
      'account_type': '10',
      'device_type': _getConnectivityCode(connectivityType),
    };

    final res =
        await methodChannel.invokeMethod<String>('startTransaction', args);
    return res;
  }

  @override
  Future<void> closeRavenPay(BuildContext context) async {
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.isFirst);
  }

  int _getConnectivityCode(ConnectivityType connectivityType) {
    switch (connectivityType) {
      case ConnectivityType.bluetooth:
        return 0;
      case ConnectivityType.otg:
        return 0;
      default:
        return 00;
    }
  }

  @override
  void setConfig(RavenMobilePOSConfig config) {
    this.config = config;
  }
}
