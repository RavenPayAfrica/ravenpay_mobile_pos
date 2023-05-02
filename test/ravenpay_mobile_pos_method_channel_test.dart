import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ravenpay_mobile_pos/ravenpay_mobile_pos_method_channel.dart';

void main() {
  MethodChannelRavenpayMobilePos platform = MethodChannelRavenpayMobilePos();
  const MethodChannel channel = MethodChannel('ravenpay_mobile_pos');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
