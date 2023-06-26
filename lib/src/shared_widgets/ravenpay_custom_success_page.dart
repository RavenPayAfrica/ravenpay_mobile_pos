import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class RavenPayCustomSuccessPage extends StatefulWidget {
  final String header;
  final String subText;
  const RavenPayCustomSuccessPage(
      {super.key, required this.header, required this.subText});

  @override
  State<RavenPayCustomSuccessPage> createState() =>
      _RavenPayCustomSuccessPageState();
}

class _RavenPayCustomSuccessPageState extends State<RavenPayCustomSuccessPage> {
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
                  height: 64,
                  width: 64,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: pluginTheme.onPrimary, shape: BoxShape.circle),
                  child: Image.asset(
                    loadAsset("check.png"),
                    color: pluginTheme.primaryColor,
                  )),
              const Gap(12),
              Text(widget.header,
                  style: headling1.copyWith(
                      color: pluginTheme.onPrimary, fontSize: 18)),
              const Gap(12),
              Text(
                widget.subText,
                textAlign: TextAlign.center,
                style: subtitle2.copyWith(
                    color: pluginTheme.onPrimary, fontSize: 16),
              ),
              const Gap(24),
            ],
          ),
        ));
  }
}
