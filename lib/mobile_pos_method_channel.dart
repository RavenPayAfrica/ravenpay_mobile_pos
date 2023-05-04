import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Future<void> closeRavenPay(BuildContext context) async {
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.isFirst);
  }
}
