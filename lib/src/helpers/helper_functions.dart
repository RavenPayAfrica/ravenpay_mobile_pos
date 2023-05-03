import 'package:flutter/material.dart';

String loadAsset(String asset) {
  return "packages/mobile_pos/assets/$asset";
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

Future<void> pushAndRemoveAll(BuildContext context, Widget page) async {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (va) => true);
  return;
}
