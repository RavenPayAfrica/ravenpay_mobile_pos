import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class ScanPin extends StatelessWidget {
  const ScanPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.lightOragen,
          borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        Image.asset(
          loadAsset("scan_pin.png"),
          height: 16,
        ),
        const Gap(4),
        Text("Scan PIN",
            style: subtitle2.copyWith(color: pluginTheme.secondaryColor))
      ]),
    );
  }
}
