import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/connect_device.dart';
import 'package:mobile_pos/src/views/pay_with_code/pay_with_code.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_bottomsheet_capsule.dart';

class CardAuthMethodSheet extends StatelessWidget {
  const CardAuthMethodSheet({
    super.key,
    required this.amount,
  });

  final double amount;

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
            child: Text("Select Authorization Method",
                style: headling2.copyWith(
                    fontSize: 20, color: pluginTheme.primaryColor)),
          ),
          const Gap(24),
          items(
              context: context,
              asset: "generate_pay_code.png",
              name: "Use PIN",
              onTap: () {
                pushRoute(
                    context,
                    ConnectDevice(
                      amount: amount,
                      cardAuthMethod: CardAuthMethod.pin,
                    ));
              }),
          const Gap(8),
          Divider(color: AppColors.ravenPayGrey2.withOpacity(0.5)),
          const Gap(8),
          items(
              context: context,
              asset: "secure_pin.png",
              name: "Secure QRCode Scan",
              onTap: () {
                pushRoute(
                    context,
                    ConnectDevice(
                      amount: amount,
                      cardAuthMethod: CardAuthMethod.qrCode,
                    ));
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
          Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.ravenLightGrey4),
              child: Image.asset(loadAsset(asset), height: 32)),
          const Gap(16),
          Expanded(
              child: Text(name,
                  style: headling2.copyWith(
                      fontSize: 15, color: AppColors.ravenPayDark))),
          const Icon(Icons.arrow_forward_ios, size: 16)
        ],
      ),
    );
  }
}
