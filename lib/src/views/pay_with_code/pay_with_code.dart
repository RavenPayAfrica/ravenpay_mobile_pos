import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/widget/see_how_to_connect.dart';
import 'package:mobile_pos/src/views/pay_with_code/confim_business_details.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_textfeild.dart';

class PayWithCode extends StatefulWidget {
  const PayWithCode({super.key});

  @override
  State<PayWithCode> createState() => _PayWithCodeState();
}

class _PayWithCodeState extends State<PayWithCode> {
  final _payCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RavenPayButton(
              enabled: _payCodeController.text.isNotEmpty,
              buttonText: "Proceed",
              onPressed: () {
                pushRoute(context, const ConfirmBusinessDetails());
              },
            ),
            const Gap(24),
            const PoweredByRaven(fontSize: 9),
            const Gap(24),
          ],
        ),
      ),
      showLogo: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        child: Column(
          children: [
            const Gap(24),
            Row(
              children: const [
                RavenPayCloseButton(
                  text: "Back",
                  isArrow: true,
                ),
                Spacer(),
                SeeHowToConnect(
                  text: "How it works",
                  showIcon: false,
                  fontWeight: FontWeight.w900,
                ),
              ],
            ),
            const Gap(24),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Request a Pay-code", style: headling1)),
            const Gap(12),
            RichText(
                text: TextSpan(
                    text:
                        "Pay-code allows merchants receive payment using your terminal. ",
                    style: subtitle2.copyWith(fontSize: 14),
                    children: [
                  TextSpan(
                    text: "see Instruction above",
                    style: subtitle2.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: pluginTheme.secondaryColor),
                  )
                ])),
            const Gap(24),
            RavenPayTextField(
              controller: _payCodeController,
              onChanged: (val) {
                setState(() {});
              },
              labelText: "Pay-Code",
              hintText: "0",
            ),
          ],
        ),
      ),
    );
  }
}
