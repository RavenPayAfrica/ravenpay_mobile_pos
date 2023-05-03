import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/ui/home/raven_pay_app.dart';
import 'package:mobile_pos/src/widget/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/widget/ravenpay_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class CardSuccessPage extends StatefulWidget {
  const CardSuccessPage({super.key});

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
                    pushAndRemoveAll(context, const RavenPayApp());
                  },
                  height: 54,
                  textColor: AppColors.ravenDarkGreen,
                  buttonText: "Share Receipt",
                  buttonColor: Colors.white,
                )),
                const Gap(24),
                Expanded(
                  child: RavenPayButton(
                    height: 54,
                    textColor: AppColors.ravenDarkGreen,
                    buttonText: "Close Payment",
                    buttonColor: Colors.white,
                  ),
                ),
              ],
            ),
            const Gap(24),
            const PoweredByRaven(
              transpirent: true,
              fontSize: 10,
            ),
            const Gap(34),
          ]),
        ),
        backgroundColor: AppColors.ravenDarkGreen,
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
                  style: headling2.copyWith(color: Colors.white, fontSize: 20)),
              const Gap(8),
              Text("You have successfully received",
                  style: subtitle2.copyWith(color: AppColors.ravenPayGrey2)),
              const Gap(4),
              Text("N54,120.00", style: subtitle.copyWith(color: Colors.white)),
              const Gap(74),
            ],
          ),
        ));
  }
}
