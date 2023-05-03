import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class PoweredByRaven extends StatelessWidget {
  final double fontSize;
  final bool transpirent;
  final double paddingBottom;
  const PoweredByRaven(
      {super.key,
      this.transpirent = false,
      this.fontSize = 12,
      this.paddingBottom = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 228, 228, 228),
                          spreadRadius: 1,
                          blurRadius: 0.5)
                    ],
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Powered By",
                      style: subtitle.copyWith(
                          fontSize: fontSize, color: AppColors.darkGrey),
                    ),
                    const Gap(4),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Image.asset(loadAsset("raven_logo.png"),
                          height: fontSize),
                    )
                  ],
                )),
          ],
        ),
        Gap(paddingBottom)
      ],
    );
  }
}
