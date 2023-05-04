import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/ui/card_payment/connect_device.dart';
import 'package:mobile_pos/src/ui/pay_with_code/pay_with_code.dart';
import 'package:mobile_pos/src/widget/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/widget/purchase_amount.dart';
import 'package:mobile_pos/src/widget/ravenpay_bottomsheet_capsule.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(16),
          const RavenPayBottomSheetCapsule(),
          const Gap(24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Select Payment Method",
                style: headling2.copyWith(fontSize: 20)),
          ),
          const Gap(24),
          items(
              context: context,
              asset: "card_payment.png",
              name: "Card Payment",
              onTap: () {
                pushRoute(
                    context,
                    PurchaseAmount(
                        callback: (mcontext) {
                          pushRoute(mcontext, const ConnectDevice());
                        },
                        title: "Requested Amount"));
              }),
          const Gap(8),
          Divider(color: AppColors.ravenPayGrey2.withOpacity(0.5)),
          const Gap(8),
          items(
              context: context,
              asset: "pay_with_code.png",
              name: "Pay-Code",
              onTap: () {
                pushRoute(context, const PayWithCode());
              }),
          const Gap(34),
          const PoweredByRaven(fontSize: 9),
          const Gap(24),
        ],
      ),
    );
  }

  Widget items(
      {required BuildContext context,
      required String name,
      required String asset,
      required Function onTap}) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Row(
        children: [
          Image.asset(loadAsset(asset), height: 32),
          const Gap(16),
          Expanded(child: Text(name, style: headling2.copyWith(fontSize: 15))),
          const Icon(Icons.arrow_forward_ios, size: 16)
        ],
      ),
    );
  }
}
