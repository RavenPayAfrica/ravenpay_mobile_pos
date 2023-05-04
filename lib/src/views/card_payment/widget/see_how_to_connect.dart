import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class SeeHowToConnect extends StatelessWidget {
  final String? text;
  final bool showIcon;
  final FontWeight? fontWeight;
  const SeeHowToConnect(
      {super.key, this.fontWeight, this.text, this.showIcon = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.lightOragen,
          borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        if (showIcon) ...[
          Image.asset(
            loadAsset("warning.png"),
            height: 16,
          ),
          const Gap(4),
        ],
        Text(text ?? "See how to connect",
            style: subtitle.copyWith(
                color: AppColors.ravenOrageColor, fontWeight: fontWeight))
      ]),
    );
  }
}