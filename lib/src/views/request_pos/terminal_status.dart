import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/shared_widgets/raven_pay_appbar.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class TerminalStatus extends StatefulWidget {
  const TerminalStatus({super.key});

  @override
  State<TerminalStatus> createState() => _TerminalStatusState();
}

class _TerminalStatusState extends State<TerminalStatus> {
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        showLogo: true,
        backgroundColor: Colors.white,
        appBar: ravenPayAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Gap(24),
            Text("Terminal Status",
                style: headling1.copyWith(color: AppColors.ravenDark)),
            const Gap(12),
            Text("Elatech Solution",
                style: headling2.copyWith(color: AppColors.ravenPayGrey3)),
            const Gap(8),
            Row(
              children: [
                Text(
                  "Order #123456",
                  style: subtitle2.copyWith(fontSize: 14),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 4,
                  width: 4,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.ravenPayGrey3),
                ),
                Text(
                  "June 16th 2023",
                  style: subtitle2.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Gap(24),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 34)
                    ]),
                child: Column(
                  children: const [
                    Item(
                      title: "Order Received",
                      completed: true,
                    ),
                    Item(
                      title: "Terminal Ready for delivery",
                      asset: "package.png",
                    ),
                    Item(
                      title: "Terminal Shipped",
                      asset: "bus.png",
                    ),
                    Item(
                      title: "Arriving Today",
                      asset: "bus.png",
                    ),
                    Item(
                      title: "Package delivered",
                      isLastItem: true,
                      icon: Icons.check_circle_outline,
                    )
                  ],
                )),
            const Gap(24),
            const HelpExplainer()
          ]),
        ));
  }
}

class Item extends StatelessWidget {
  final String? asset;
  final bool completed;
  final String title;
  final bool isLastItem;
  final IconData? icon;
  const Item(
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

class HelpExplainer extends StatelessWidget {
  const HelpExplainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.lightOragen),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  color: AppColors.ravenOrageColor,
                  size: 16,
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Having issues with your order contact the ",
                          style: subtitle2.copyWith(
                              color: AppColors.ravenPayGrey3,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.5,
                              fontFamily: "br_light"),
                        ),
                        const Gap(2),
                        Text("customer care line.",
                            style: subtitle.copyWith(
                                fontSize: 13,
                                wordSpacing: 1,
                                fontFamily: "br_bold",
                                color: AppColors.ravenOrageColor))
                      ]),
                ),
              ],
            ),
          ],
        ));
  }
}
