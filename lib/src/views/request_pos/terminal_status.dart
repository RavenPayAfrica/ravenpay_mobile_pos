import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        appBar: ravenPayAppBar(),
        body: SingleChildScrollView(
          child: Column(children: const [
            Gap(12),
          ]),
        ));
  }
}

class Pickup extends StatelessWidget {
  const Pickup({
    super.key,
  });

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
                          "Pick up address: 20 The Quad Layi Yusuf off Admiralty way. Lekki  Lagos Nigeria.",
                          style: subtitle2.copyWith(
                              color: AppColors.ravenPayGrey3,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.5,
                              fontFamily: "br_light"),
                        ),
                        const Gap(2),
                        Text("Business Hours: 8:00am - 5:00pm",
                            style: subtitle.copyWith(
                                fontSize: 13,
                                wordSpacing: 1,
                                fontFamily: "br_bold",
                                color: AppColors.ravenDark))
                      ]),
                ),
              ],
            ),
          ],
        ));
  }
}
