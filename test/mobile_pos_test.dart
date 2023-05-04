import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_pos/mobile_pos.dart';
import 'package:mobile_pos/mobile_pos_platform_interface.dart';
import 'package:mobile_pos/mobile_pos_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMobilePosPlatform
    with MockPlatformInterfaceMixin
    implements MobilePosPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> startRavenPay(BuildContext context) {
    // TODO: implement startRavenPay
    throw UnimplementedError();
  }

  @override
  Future<void> closeRavenPay(BuildContext context) {
    // TODO: implement closeRavenPay
    throw UnimplementedError();
  }
}

void main() {
  final MobilePosPlatform initialPlatform = MobilePosPlatform.instance;

  test('$MethodChannelMobilePos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMobilePos>());
  });

  test('getPlatformVersion', () async {
    MobilePos mobilePosPlugin = MobilePos();
    MockMobilePosPlatform fakePlatform = MockMobilePosPlatform();
    MobilePosPlatform.instance = fakePlatform;

    expect(await mobilePosPlugin.getPlatformVersion(), '42');
  });
}
