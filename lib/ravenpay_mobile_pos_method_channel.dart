import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ravenpay_mobile_pos_platform_interface.dart';

/// An implementation of [RavenpayMobilePosPlatform] that uses method channels.
class MethodChannelRavenpayMobilePos extends RavenpayMobilePosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ravenpay_mobile_pos');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
