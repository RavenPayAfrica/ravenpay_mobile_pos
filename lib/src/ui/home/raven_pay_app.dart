import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/ui/home/payment_method_bottomsheet.dart';
import 'package:mobile_pos/src/ui/home/widget/home_item.dart';
import 'package:mobile_pos/src/ui/pay_with_code/pay_with_code.dart';
import 'package:mobile_pos/src/widget/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/widget/ravenpay_background.dart';
import 'package:mobile_pos/src/widget/ravenpay_bottomsheet.dart';
import 'package:mobile_pos/src/widget/ravenpay_close_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class RavenPayApp extends StatefulWidget {
  const RavenPayApp({super.key});

  @override
  State<RavenPayApp> createState() => _RavenPayAppState();
}

class _RavenPayAppState extends State<RavenPayApp> {
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
      body: Column(
        children: [
          RavenPayBackground(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(24),
                const RavenPayCloseButton(),
                const Gap(28),
                Text("Accept Payment  faster with your terminal.",
                    style: headling1)
              ],
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          HomeItem(
              onTap: () {
                showRavenPayBottomSheet(context, child: const PaymentMethod());
              },
              asset: "receive_payment.png",
              title: "Receive Payment",
              subTitile: "Accept payment from your customers"),
          HomeItem(
              onTap: () {
                pushRoute(context, const PayWithCode());
              },
              asset: "generate_pay_code.png",
              title: "Generate Pay-code",
              subTitile: "Receive payment from a third-party terminal"),
          const HomeItem(
              asset: "secure_pin.png",
              title: "Secure PIN Share",
              subTitile: "Accept payment from your customers"),
          const HomeItem(
              asset: "reward.png",
              title: "Rewards",
              subTitile: "Accept payment from your customers"),
          const Gap(12),
          const PoweredByRaven(),
          const Gap(24),
        ]),
      ),
    );
  }
}
