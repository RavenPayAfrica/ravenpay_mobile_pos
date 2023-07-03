import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/models/terminal_model.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/request_pos/terminal_status.dart';
import 'package:mobile_pos/src/views/request_pos/view_terminal_info.dart';

class TerminalItem extends StatelessWidget {
  final TerminalModel model;
  final void Function()? onlabelUpdated;

  const TerminalItem({
    super.key,
    required this.model,
    this.onlabelUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (model.serial == null) {
          pushRoute(context, const TerminalStatus());
          return;
        }
        pushRoute(
            context,
            ViewTerminalInfo(
              model: model,
              onlabelUpdated: onlabelUpdated ?? () {},
            ));
      },
      child: CardShadowViewLight(
        child: Column(
          children: [
            const Gap(12),
            Row(
              children: [
                const Gap(6),
                Image.asset(loadAsset("mpos_image.png"), height: 40),
                const Gap(16),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.tidLabel ?? '',
                            style: headling2.copyWith(
                                color: pluginTheme.primaryColor, fontSize: 16)),
                        const Gap(4),
                        if (model.serial != null) ...[
                          Text(
                            model.serial ?? '',
                            style: subtitle2.copyWith(
                                fontSize: 14, color: AppColors.darkGrey),
                          )
                        ] else ...[
                          Text(
                            "Pending Delivery",
                            style: subtitle2.copyWith(
                                fontSize: 14, color: AppColors.ravenGreyLight1),
                          )
                        ]
                      ]),
                ),
              ],
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}

class TerminalRequestItem extends StatelessWidget {
  final TerminalRequestModel model;

  const TerminalRequestItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Column(
        children: [
          const Gap(8),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.ravenLightGrey.withOpacity(0.3)),
                child: Icon(Icons.info_outline_rounded,
                    color: AppColors.ravenLightGrey),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Terminal Request (x${model.quantity})',
                          style: headling2.copyWith(
                              color: pluginTheme.primaryColor, fontSize: 14)),
                      const Gap(4),
                      Text(
                        "Pending Approval",
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
      ),
    );
  }
}

class CardShadowViewLight extends StatelessWidget {
  final Widget child;
  final double? vertical;
  const CardShadowViewLight({Key? key, required this.child, this.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.07),
              blurRadius: 18,
              spreadRadius: 7,
            ),
          ],
        ),
        child: child);
  }
}
