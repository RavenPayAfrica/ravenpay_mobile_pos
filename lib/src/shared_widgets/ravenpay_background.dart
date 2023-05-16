import 'package:flutter/material.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';

class RavenPayBackground extends StatelessWidget {
  final Widget child;

  const RavenPayBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        height: 394,
        width: double.infinity,
        child: child);
  }
}
