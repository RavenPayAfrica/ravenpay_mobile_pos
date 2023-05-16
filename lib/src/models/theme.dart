import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';

class MobilePOSTheme {
  final Color? primaryColor;
  final Color? headerTextColor;
  final Color? secondaryColor;
  final Color? onPrimary;
  final Widget? logo;

  const MobilePOSTheme(
      {this.primaryColor,
      this.headerTextColor,
      this.onPrimary,
      this.logo,
      this.secondaryColor});

  factory MobilePOSTheme.defaults() {
    return MobilePOSTheme(
        headerTextColor: AppColors.ravenPayGreen,
        secondaryColor: AppColors.ravenOrageColor,
        onPrimary: Colors.white,
        logo: SizedBox(),
        primaryColor: AppColors.ravenPayGreen);
  }
}
