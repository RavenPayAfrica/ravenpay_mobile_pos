import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';

class MobilePOSTheme {
  final Color? primaryColor;
  final Color? headerTextColor;
  final Color? bodyTextColor;
  final Color? foreGroundColor;
  final Color? backgroundColor;
  final Color? onPrimary;
  final Widget? logo;

  const MobilePOSTheme(
      {this.primaryColor,
      this.headerTextColor,
      this.foreGroundColor,
      this.bodyTextColor,
      this.onPrimary,
      this.logo,
      this.backgroundColor});

  factory MobilePOSTheme.defaults() {
    return MobilePOSTheme(
        backgroundColor: AppColors.ravenPayGreen,
        foreGroundColor: Colors.white,
        headerTextColor: AppColors.ravenPayGreen,
        bodyTextColor: AppColors.ravenPayGrey,
        onPrimary: Colors.white,
        logo: SizedBox(),
        primaryColor: AppColors.ravenPayGreen);
  }
}
