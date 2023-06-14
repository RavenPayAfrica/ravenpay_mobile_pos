import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/widget/see_how_to_connect.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class ConnectOtg extends StatefulWidget {
  const ConnectOtg({super.key});

  @override
  State<ConnectOtg> createState() => _ConnectOtgState();
}

class _ConnectOtgState extends State<ConnectOtg> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        showLogo: true,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(
            children: [
              const Gap(24),
              Row(
                children: const [
                  RavenPayCloseButton(isArrow: true, text: "Back"),
                  Spacer(),
                  SeeHowToConnect()
                ],
              ),
              const Gap(24),
              Align(
                  alignment: Alignment.centerLeft,
                  child: RavenPayText.heading(
                    "Connect OTG",
                    fontSize: 20,
                  )),
              const Gap(24),
              Image.asset(
                loadAsset("connect_otg.png"),
                height: 180,
              ),
              const Gap(12),
              Text(
                "Connecting to device, wait a minute",
                style: subtitle.copyWith(color: pluginTheme.primaryColor),
              ),
              const Spacer(),
              const Gap(34),
              RavenPayButton(
                buttonText: "Proceed",
                onPressed: () {
                  // pushRoute(context, const InsertCard());
                },
              ),
              const Gap(74),
            ],
          ),
        ));
  }
}
