import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        Row(
          children: [
            Image.asset(loadAsset("mpos_icon.png"), height: 34),
            const Gap(16),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Elatech Solution 1",
                        style: headling2.copyWith(
                            color: pluginTheme.primaryColor, fontSize: 14)),
                    const Gap(4),
                    Text(
                      "Seria No: 123345543222",
                      style: subtitle2.copyWith(
                          fontSize: 14, color: AppColors.ravenGreyLight1),
                    )
                  ]),
            )
          ],
        ),
        const Gap(8),
        const Divider()
      ],
    );
  }
}
