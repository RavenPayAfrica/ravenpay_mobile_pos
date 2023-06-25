import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';

class MobilePOSTheme {
  final Color primaryColor;
  final Color headerTextColor;
  final Color secondaryColor;
  final Color onPrimary;
  // final String? logo;

  const MobilePOSTheme(
      {required this.primaryColor,
      required this.headerTextColor,
      required this.onPrimary,
      // this.logo,
      required this.secondaryColor});

  factory MobilePOSTheme.defaults() {
    return MobilePOSTheme(
        headerTextColor: AppColors.ravenPayGreen,
        secondaryColor: AppColors.ravenOrageColor,
        onPrimary: Colors.white,
        // logo: "packages/mobile_pos/assets/images/company_logo.png",
        primaryColor: AppColors.ravenPayGreen);
  }
}
