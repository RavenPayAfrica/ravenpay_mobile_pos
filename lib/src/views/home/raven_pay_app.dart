import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/generate_paycode/business_phone_number.dart';
import 'package:mobile_pos/src/views/home/widget/payment_method_bottomsheet.dart';
import 'package:mobile_pos/src/views/home/widget/home_item.dart';
import 'package:mobile_pos/src/views/secure_pin_share/add_card_pin.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/purchase_amount.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_background.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_bottomsheet.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

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
                pushRoute(
                    context,
                    PurchaseAmount(
                        onProceed: (mContext, amount) =>
                            pushRoute(mContext, const BusinessPhoneNumber()),
                        title: "Requested Amount"));
              },
              asset: "generate_pay_code.png",
              title: "Generate Pay-code",
              subTitile: "Receive payment from a third-party terminal"),
          HomeItem(
              onTap: () {
                pushRoute(context, const AddCardPin());
              },
              asset: "secure_pin.png",
              title: "Secure PIN Share",
              subTitile: "Accept payment from your customers"),
          const HomeItem(
              asset: "reward.png",
              title: "Rewards",
              subTitile: "Accept payment from your customers"),
          const Gap(16),
          const PoweredByRaven(),
          const Gap(24),
        ]),
      ),
    );
  }
}
