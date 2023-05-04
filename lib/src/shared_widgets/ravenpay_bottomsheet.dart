import 'package:flutter/material.dart';

Future<T?> showRavenPayBottomSheet<T>(
  BuildContext context, {
  required Widget child,
}) async {
  return showModalBottomSheet<T>(
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return child;
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), bottom: Radius.circular(0)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}
