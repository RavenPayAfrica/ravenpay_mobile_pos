import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

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
              onPressed: () {
                toRavenPayHome(context);
              },
              height: 54,
              textColor: pluginTheme.primaryColor,
              buttonText: "Close",
              buttonColor: pluginTheme.onPrimary,
            ),
            const Gap(24),
            const PoweredByRaven(
              transparent: true,
              fontSize: 10,
            ),
            const Gap(34),
          ]),
        ),
        backgroundColor: pluginTheme.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(size.height * 0.2),
              Container(
                  height: 84,
                  width: 84,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: pluginTheme.onPrimary, shape: BoxShape.circle),
                  child: Image.asset(
                    loadAsset("check.png"),
                    color: pluginTheme.primaryColor,
                  )),
              const Gap(12),
              Text("Code Generated Successfully",
                  style: subtitle.copyWith(
                      color: pluginTheme.onPrimary, fontSize: 14)),
              const Gap(12),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.ravenGreyLight.withOpacity(0.2)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "563-145",
                        style: headling2.copyWith(color: pluginTheme.onPrimary),
                      ),
                      const Gap(8),
                      Image.asset(
                        loadAsset("copy_icon.png"),
                        height: 16,
                      )
                    ],
                  )),
              const Gap(20),
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
                        color: pluginTheme.onPrimary,
                      ),
                      Expanded(
                        child: Text(
                          "Ensure to use this code within the next one hour unless, you would need to generate a new one",
                          textAlign: TextAlign.center,
                          style: subtitle2.copyWith(
                              color: pluginTheme.onPrimary, fontSize: 12),
                        ),
                      ),
                    ],
                  )),
              const Gap(24),
            ],
          ),
        ));
  }
}
