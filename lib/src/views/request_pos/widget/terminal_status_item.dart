import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class TerminlStatusItem extends StatelessWidget {
  final String? asset;
  final bool completed;
  final String title;
  final bool isLastItem;
  final IconData? icon;
  const TerminlStatusItem(
      {super.key,
      this.asset,
      required this.title,
      this.icon,
      this.isLastItem = false,
      this.completed = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Gap(8),
            if (asset == null && icon == null) ...[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.ravenPayGrey),
              ),
            ] else if (icon != null) ...[
              Icon(
                icon,
                size: 20,
                color:
                    pluginTheme.primaryColor.withOpacity(completed ? 1 : 0.4),
              )
            ] else ...[
              Image.asset(
                loadAsset(asset!),
                color:
                    pluginTheme.primaryColor.withOpacity(completed ? 1 : 0.4),
                height: 20,
              ),
            ],
            if (!isLastItem) ...[
              Container(
                height: 54,
                width: 1,
                color: AppColors.ravenPayGrey2,
              )
            ]
          ],
        ),
        const Gap(12),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: bodyText.copyWith(
                  fontSize: 14,
                  color:
                      pluginTheme.primaryColor.withOpacity(completed ? 1 : 0.4),
                )),
            const Gap(8),
            Text("12:08:23 * 08:24am", style: subtitle2)
          ]),
        )
      ],
    );
  }
}
