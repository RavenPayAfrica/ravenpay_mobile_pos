import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ravenpay_mobile_pos_method_channel.dart';

abstract class RavenpayMobilePosPlatform extends PlatformInterface {
  /// Constructs a RavenpayMobilePosPlatform.
  RavenpayMobilePosPlatform() : super(token: _token);

  static final Object _token = Object();

  static RavenpayMobilePosPlatform _instance = MethodChannelRavenpayMobilePos();

  /// The default instance of [RavenpayMobilePosPlatform] to use.
  ///
  /// Defaults to [MethodChannelRavenpayMobilePos].
  static RavenpayMobilePosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RavenpayMobilePosPlatform] when
  /// they register themselves.
  static set instance(RavenpayMobilePosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
