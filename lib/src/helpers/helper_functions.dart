import 'package:flutter/material.dart';

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
