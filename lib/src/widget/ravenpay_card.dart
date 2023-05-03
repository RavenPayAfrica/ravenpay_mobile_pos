import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';

class RavenPayCard extends StatelessWidget {
  final Widget child;
  final double? height;
  const RavenPayCard({super.key, this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.ravenPayGrey2, width: 0.5)),
        child: child);
  }
}
