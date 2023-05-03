import 'package:flutter/material.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mobile_pos_method_channel.dart';

abstract class MobilePosPlatform extends PlatformInterface {
  /// Constructs a MobilePosPlatform.
  MobilePosPlatform() : super(token: _token);

  static final Object _token = Object();

  static MobilePosPlatform _instance = MethodChannelMobilePos();

  /// The default instance of [MobilePosPlatform] to use.
  ///
  /// Defaults to [MethodChannelMobilePos].
  static MobilePosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MobilePosPlatform] when
  /// they register themselves.
  static set instance(MobilePosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> startRavenPay(BuildContext context) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
