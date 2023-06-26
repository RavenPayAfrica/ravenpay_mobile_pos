import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/request_pos/terminal_status.dart';
import 'package:mobile_pos/src/views/request_pos/view_terminal_info.dart';

class TerminalItem extends StatelessWidget {
  final String? seriaNo;

  const TerminalItem({super.key, required this.seriaNo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (seriaNo == null) {
          pushRoute(context, const TerminalStatus());
          return;
        }
        pushRoute(
            context,
            const ViewTerminalInfo(
              terminalName: "Elatech Solution 1",
            ));
      },
      child: Column(
        children: [
          const Gap(8),
          Row(
            children: [
              if (seriaNo != null) ...[
                Image.asset(loadAsset("mpos_icon.png"), height: 40),
              ] else ...[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.ravenLightGrey.withOpacity(0.3)),
                  child: Icon(Icons.info_outline_rounded,
                      color: AppColors.ravenLightGrey),
                )
              ],
              const Gap(16),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Elatech Solution 1",
                          style: headling2.copyWith(
                              color: pluginTheme.primaryColor, fontSize: 14)),
                      const Gap(4),
                      if (seriaNo != null) ...[
                        Text(
                          seriaNo!,
                          style: subtitle2.copyWith(
                              fontSize: 14, color: AppColors.ravenGreyLight1),
                        )
                      ] else ...[
                        Text(
                          "Pending Delivery",
                          style: subtitle2.copyWith(
                              fontSize: 14, color: AppColors.ravenGreyLight1),
                        )
                      ]
                    ]),
              )
            ],
          ),
          const Gap(8),
          const Divider()
        ],
      ),
    );
  }
}
