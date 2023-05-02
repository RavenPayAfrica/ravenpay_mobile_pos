import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mobile_pos_platform_interface.dart';

/// An implementation of [MobilePosPlatform] that uses method channels.
class MethodChannelMobilePos extends MobilePosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mobile_pos');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
