import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/models/success_response.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/share_receipt.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class CardSuccessPage extends StatefulWidget {
  const CardSuccessPage(
      {super.key, required this.response, required this.amount});
  final RavenMPOSResponse response;
  final double amount;

  @override
  State<CardSuccessPage> createState() => _CardSuccessPageState();
}

class _CardSuccessPageState extends State<CardSuccessPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RavenPayScaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                Expanded(
                    child: RavenPayButton(
                  onPressed: () {
                    pushRoute(context, const ShareReceipt());
                  },
                  height: 48,
                  textColor: pluginTheme.primaryColor,
                  buttonText: "Share Receipt",
                  buttonColor: pluginTheme.onPrimary,
                )),
                const Gap(24),
                Expanded(
                  child: RavenPayButton(
                    onPressed: () {
                      toRavenPayHome(context);
                    },
                    height: 48,
                    textColor: pluginTheme.primaryColor,
                    buttonText: "Close Payment",
                    buttonColor: pluginTheme.onPrimary,
                  ),
                ),
              ],
            ),
            const Gap(32),
            const PoweredByRaven(
              transparent: true,
              fontSize: 10,
            ),
            const Gap(24),
          ]),
        ),
        backgroundColor: pluginTheme.primaryColor,
        showLogo: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(
            children: [
              Gap(size.height * 0.2),
              Image.asset(
                loadAsset("success_image.png"),
                height: 180,
              ),
              Text("Transaction Successful",
                  style: headling2.copyWith(
                      color: pluginTheme.onPrimary, fontSize: 18)),
              const Gap(8),
              Text("You have successfully received,",
                  style: subtitle2.copyWith(color: pluginTheme.onPrimary)),
              const Gap(4),
              RichText(
                  text: TextSpan(
                      text: '₦',
                      style: headling1.copyWith(
                          fontFamily: 'Roboto',
                          fontSize: 22,
                          color: pluginTheme.onPrimary,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: formatAmount(widget.amount),
                        style: headling1.copyWith(
                            color: pluginTheme.onPrimary, fontSize: 24))
                  ])),
              const Gap(74),
            ],
          ),
        ));
  }
}
