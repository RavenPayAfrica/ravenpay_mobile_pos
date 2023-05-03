import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/ui/secure_pin_share/generate_qr_code.dart';
import 'package:mobile_pos/src/widget/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/widget/ravenpay_amount_pad.dart';
import 'package:mobile_pos/src/widget/ravenpay_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_close_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_pin_widget.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class AddCardPin extends StatefulWidget {
  const AddCardPin({super.key});

  @override
  State<AddCardPin> createState() => _AddCardPinState();
}

class _AddCardPinState extends State<AddCardPin> {
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
                  ],
                ),
                const Gap(24),
                Align(
                    alignment: Alignment.centerLeft,
                    child: RavenPayText.heading(
                      "Add Card PIN",
                      fontSize: 20,
                    )),
                const Gap(12),
                Text(
                    "Add your Card PIN here and click generate to generate a code to share with an Agent.",
                    style: subtitle2.copyWith(fontSize: 14)),
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
                    buttonText: "Generate QR",
                    onPressed: () {
                      pushRoute(context, const GenerateQrCode());
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
