import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/widget/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/widget/ravenpay_amount_pad.dart';
import 'package:mobile_pos/src/widget/ravenpay_background.dart';
import 'package:mobile_pos/src/widget/ravenpay_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_close_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class PurchaseAmount extends StatefulWidget {
  final Function callback;
  final String? title;
  const PurchaseAmount({super.key, required this.callback, this.title});

  @override
  State<PurchaseAmount> createState() => _PurchaseAmountState();
}

class _PurchaseAmountState extends State<PurchaseAmount> {
  String amount = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RavenPayScaffold(
      body: Stack(
        children: [
          SizedBox(height: size.height),
          SizedBox(
            child: RavenPayBackground(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(24),
                  const RavenPayCloseButton(
                    isArrow: true,
                    text: "Back",
                  ),
                  const Gap(28),
                  Text(widget.title ?? "Enter Amount", style: headling1),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(amount.isEmpty ? "0.00" : amount,
                        style: headling1.copyWith(fontSize: 34))),
                SizedBox(
                  height: 340,
                  width: size.width,
                  child: Column(
                    children: [
                      RavenPayAmountPad(
                          onChange: (val) {
                            amount = val;
                            setState(() {});
                          },
                          amount: amount),
                    ],
                  ),
                ),
                const Gap(24),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
                  child: RavenPayButton(
                    enabled: amount.isNotEmpty,
                    buttonText: "Proceed",
                    onPressed: () {
                      try {
                        var val = double.tryParse(amount);
                        if (val! <= 0) {
                          return;
                        }
                        widget.callback(context);
                      } catch (ex) {
                        return;
                      }
                    },
                  ),
                ),
                const Gap(16),
                const PoweredByRaven(
                  fontSize: 9,
                ),
                const Gap(16),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
