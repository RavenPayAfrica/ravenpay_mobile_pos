import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/widget/scan_pin.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_amount_pad.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_pin_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class CardPin extends StatefulWidget {
  const CardPin({super.key});

  @override
  State<CardPin> createState() => _CardPinState();
}

class _CardPinState extends State<CardPin> {
  final _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RavenPayScaffold(
      body: Stack(
        children: [
          SizedBox(height: size.height),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(24),
                Row(
                  children: const [
                    RavenPayCloseButton(isArrow: true, text: "Back"),
                    Spacer(),
                    ScanPin()
                  ],
                ),
                const Gap(24),
                Align(
                    alignment: Alignment.centerLeft,
                    child: RavenPayText.heading(
                      "Card PIN",
                      fontSize: 20,
                    )),
                const Gap(12),
                RichText(
                    text: TextSpan(
                        text:
                            "Give the user your device to enter their Card PIN or guide them to use the ",
                        style: subtitle2.copyWith(fontSize: 14),
                        children: [
                      TextSpan(
                          text: "Scan PIN",
                          style: subtitle2.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: pluginTheme.secondaryColor),
                          children: [
                            TextSpan(
                              text: " method above.",
                              style: subtitle2.copyWith(fontSize: 14),
                            )
                          ])
                    ])),
                const Gap(34),
                RavenPayPinWidget(
                  pinController: _pinController,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: 340,
                  width: size.width,
                  child: Column(
                    children: [
                      RavenPayAmountPad(
                          length: 4,
                          onChange: (val) {
                            _pinController.text = val;
                            setState(() {});
                          },
                          amount: _pinController.text),
                    ],
                  ),
                ),
                const Gap(24),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
                  child: RavenPayButton(
                    enabled: _pinController.text.length == 4,
                    buttonText: "Proceed",
                    onPressed: () {
                      // pushRoute(context, const CardSuccessPage());
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
