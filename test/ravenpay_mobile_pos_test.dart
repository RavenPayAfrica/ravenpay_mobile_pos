import 'package:flutter_test/flutter_test.dart';
import 'package:ravenpay_mobile_pos/ravenpay_mobile_pos.dart';
import 'package:ravenpay_mobile_pos/ravenpay_mobile_pos_platform_interface.dart';
import 'package:ravenpay_mobile_pos/ravenpay_mobile_pos_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRavenpayMobilePosPlatform
    with MockPlatformInterfaceMixin
    implements RavenpayMobilePosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RavenpayMobilePosPlatform initialPlatform = RavenpayMobilePosPlatform.instance;

  test('$MethodChannelRavenpayMobilePos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRavenpayMobilePos>());
  });

  test('getPlatformVersion', () async {
    RavenpayMobilePos ravenpayMobilePosPlugin = RavenpayMobilePos();
    MockRavenpayMobilePosPlatform fakePlatform = MockRavenpayMobilePosPlatform();
    RavenpayMobilePosPlatform.instance = fakePlatform;

    expect(await ravenpayMobilePosPlugin.getPlatformVersion(), '42');
  });
}
