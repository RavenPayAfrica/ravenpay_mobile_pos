import 'package:flutter/material.dart';

class AppInfo {
  final String appName;
  final Widget? appLogo;
  final String appId;
  final String appEmail;

  AppInfo({required this.appName, this.appLogo, required this.appId, required this.appEmail});
}
