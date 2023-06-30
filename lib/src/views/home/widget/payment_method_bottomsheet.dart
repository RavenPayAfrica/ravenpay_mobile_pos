import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/shared_widgets/coming_soon_badge.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_bottomsheet.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/widget/auth_method_sheet.dart';
import 'package:mobile_pos/src/views/pay_with_code/pay_with_code.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/purchase_amount.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_bottomsheet_capsule.dart';

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
                style: headling2.copyWith(
                    fontSize: 20, color: pluginTheme.primaryColor)),
          ),
          const Gap(24),
          item(
              context: context,
              asset: "card_payment.png",
              name: "Card Payment",
              onTap: () {
                pushRoute(
                    context,
                    PurchaseAmount(
                        onProceed: (mContext, amount) {
                          showRavenPayBottomSheet(mContext,
                              child: CardAuthMethodSheet(
                                amount: amount,
                              ));

                          // pushRoute(mContext, ConnectDevice(amount: amount));
                        },
                        title: "Enter Amount"));
              }),
          const Gap(8),
          Divider(color: AppColors.ravenPayGrey2.withOpacity(0.5)),
          const Gap(8),
          item(
              comingSoon: true,
              context: context,
              asset: "generate_pay_code.png",
              name: "Paycode",
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

  Widget item({
    required BuildContext context,
    required String name,
    required String asset,
    required Function onTap,
    bool comingSoon = false,
  }) {
    return InkWell(
      onTap: comingSoon
          ? null
          : () {
              Navigator.pop(context);
              onTap();
            },
      child: Row(
        children: [
          Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.ravenLightGrey4),
              child: Image.asset(loadAsset(asset), height: 32)),
          const Gap(16),
          Expanded(
              child: Row(
            children: [
              Text(name,
                  style: headling2.copyWith(
                      fontSize: 15, color: AppColors.ravenPayDark)),
              if (comingSoon) ...[const Gap(8), ComingSoonBadge()]
            ],
          )),
          const Icon(Icons.arrow_forward_ios, size: 16)
        ],
      ),
    );
  }
}
