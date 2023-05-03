import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/widget/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/widget/ravenpay_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class PayCodeSuccessPage extends StatefulWidget {
  const PayCodeSuccessPage({super.key});

  @override
  State<PayCodeSuccessPage> createState() => _PayCodeSuccessPageState();
}

class _PayCodeSuccessPageState extends State<PayCodeSuccessPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RavenPayScaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            RavenPayButton(
              height: 54,
              textColor: AppColors.ravenDarkGreen,
              buttonText: "Close",
              buttonColor: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(size.height * 0.2),
              Center(
                child: Image.asset(
                  loadAsset("check_icon.png"),
                  height: 84,
                ),
              ),
              const Gap(12),
              Text("Code Generated Successfully",
                  style: subtitle.copyWith(color: Colors.white, fontSize: 16)),
              const Gap(12),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.ravenLightGrey.withOpacity(0.1)),
                  child: Row(
                    children: [
                      Image.asset(
                        loadAsset("warning.png"),
                        height: 16,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Text(
                          "Ensure to use this code within the next one hour unless, you would need to generate a new one",
                          textAlign: TextAlign.center,
                          style: subtitle2.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
