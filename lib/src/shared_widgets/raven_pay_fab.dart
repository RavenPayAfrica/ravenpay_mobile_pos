import 'package:flutter/material.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';

class RavenPayFab extends StatelessWidget {
  final Function onPressed;
  final Widget widget;
  const RavenPayFab({
    required this.onPressed,
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
              color: pluginTheme.primaryColor,
              borderRadius: BorderRadius.circular(28)),
          margin: const EdgeInsets.only(bottom: 24),
          child: widget),
    );
  }
}
