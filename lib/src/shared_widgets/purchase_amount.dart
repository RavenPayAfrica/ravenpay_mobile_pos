import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_amount_pad.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class PurchaseAmount extends StatefulWidget {
  final Function(BuildContext conext, double amount) onProceed;
  final String? title;
  const PurchaseAmount({super.key, required this.onProceed, this.title});

  @override
  State<PurchaseAmount> createState() => _PurchaseAmountState();
}

class _PurchaseAmountState extends State<PurchaseAmount> {
  String amount = "";
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
      body: Column(
        children: [
          const Gap(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
            child: Column(
              children: [
                const RavenPayCloseButton(
                  isArrow: true,
                  text: "",
                ),
                const Gap(24),
                Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text(widget.title ?? "Enter Amount", style: headling1)),
                Gap(70),
                Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                            text: '₦',
                            style: headling1.copyWith(
                                fontFamily: 'Roboto',
                                fontSize: 38,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: amount.isEmpty
                                  ? "0.00"
                                  : "${formatAmount(double.tryParse(amount) ?? 0)}",
                              style: headling1.copyWith(fontSize: 38))
                        ]))),
                Gap(24),
              ],
            ),
          ),
          const Gap(24),
          RavenPayAmountPad(
              onChange: (val) {
                amount = val;
                setState(() {});
              },
              amount: amount),
          const Gap(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
            child: RavenPayButton(
              enabled: amount.isNotEmpty,
              buttonText: "Proceed",
              onPressed: () {
                try {
                  var val = double.tryParse(amount);
                  if (val! <= 0) {
                    return;
                  }
                  widget.onProceed(context, val);
                } catch (ex) {
                  return;
                }
              },
            ),
          ),
          const Gap(24),
          const PoweredByRaven(
            fontSize: 9,
          ),
          const Gap(24),
        ],
      ),
    );
  }
}
