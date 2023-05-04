import 'package:flutter/material.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';

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
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage(loadAsset("background_image.png"))),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.lightGreen,
                  AppColors.lightGrey.withOpacity(0.0),
                ])),
        child: child);
  }
}
