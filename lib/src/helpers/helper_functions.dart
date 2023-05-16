import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
