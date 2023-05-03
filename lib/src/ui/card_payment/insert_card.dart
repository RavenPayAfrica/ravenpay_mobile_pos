import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/ui/card_payment/card_pin.dart';
import 'package:mobile_pos/src/widget/ravenpay_close_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class InsertCard extends StatefulWidget {
  const InsertCard({super.key});

  @override
  State<InsertCard> createState() => _InsertCardState();
}

class _InsertCardState extends State<InsertCard> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        pushRoute(context, const CardPin());
      }
    });
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        showLogo: true,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(
            children: [
              const Gap(24),
              Row(
                children: const [
                  RavenPayCloseButton(isArrow: true, text: "Back"),
                ],
              ),
              const Gap(24),
              Image.asset(
                loadAsset("mobile_pos.png"),
                height: 180,
              ),
              const Gap(12),
              Text(
                "Insert Card",
                style: headling2.copyWith(fontSize: 20),
              ),
              const Gap(12),
              Text(
                "Insert your card into the terminal device, and wait while we read card information.",
                style: subtitle2.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const Gap(54),
            ],
          ),
        ));
  }
}
