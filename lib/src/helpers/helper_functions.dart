import 'package:flutter/material.dart';
import 'package:flutter_aes_ecb_pkcs5/flutter_aes_ecb_pkcs5.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';

String loadAsset(String asset) {
  return "packages/mobile_pos/assets/images/$asset";
}

Future<void> pushRoute(BuildContext context, Widget page) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
  return;
}

Future<void> toRavenPayHome(BuildContext context) async {
  Navigator.popUntil(context, ModalRoute.withName("raven_pay"));
  return;
}

String formatAmount(double amount) {
  var fmt = NumberFormat('#,###.##', 'en_US');

  return "${fmt.format(amount)}";
}

Future<String?> encryptString(String data) async {
  var encryptText = await FlutterAesEcbPkcs5.encryptString(data, eKey);
  return encryptText;
}

Future<String?> decryptString(String data) async {
  var decryptText = await FlutterAesEcbPkcs5.decryptString(data, eKey);
  return decryptText;
}
