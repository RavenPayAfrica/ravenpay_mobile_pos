// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mobile_pos/mobile_pos_method_channel.dart';

// void main() {
//   MethodChannelMobilePos platform = MethodChannelMobilePos();
//   const MethodChannel channel = MethodChannel('mobile_pos');

//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {
//     channel.setMockMethodCallHandler((MethodCall methodCall) async {
//       return '42';
//     });
//   });

//   tearDown(() {
//     channel.setMockMethodCallHandler(null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await platform.getPlatformVersion(), '42');
//   });
// }
