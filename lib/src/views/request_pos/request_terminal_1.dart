import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/raven_pay_appbar.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/request_pos/request_terminal_2.dart';

class RequestTerminal1 extends StatefulWidget {
  const RequestTerminal1({super.key});

  @override
  State<RequestTerminal1> createState() => _RequestTerminal1State();
}

class _RequestTerminal1State extends State<RequestTerminal1> {
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        backgroundColor: Colors.white,
        appBar: ravenPayAppBar(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RavenPayButton(
                buttonText: "Proceed",
                onPressed: () {
                  pushRoute(context, const RequestTerminal2());
                },
              ),
              const Gap(24),
              const PoweredByRaven(fontSize: 9),
              const Gap(24),
            ],
          ),
        ),
        showLogo: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(children: [
            const Gap(12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Request Terminal",
                style: headling1,
              ),
            ),
            const Gap(16),
            Text(
                "Power your business with a powerful business toolkit, aimed at giving your business growth.",
                style: subtitle2.copyWith(fontSize: 14)),
            const Gap(28),
            Container(
                height: 200,
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.ravenLightGrey.withOpacity(0.3)),
                child: Image.asset(loadAsset("mpos_image.png"))),
            const Gap(28),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.lightOragen),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: AppColors.ravenOrageColor,
                          size: 16,
                        ),
                        const Gap(8),
                        Expanded(
                          child: Text(
                            "all you need to know about Poseidon "
                                .toUpperCase(),
                            style: subtitle.copyWith(
                                fontSize: 12, fontFamily: "br_light"),
                          ),
                        )
                      ],
                    ),
                    const Gap(8),
                    Divider(
                      color: AppColors.lightOrange2,
                    ),
                    const Gap(4),
                    const Item(
                      text: "Operated with a OTG cord or bluetooth.",
                    ),
                    const Item(
                      text: "Caution fee of N5,000.00.",
                    ),
                    const Item(
                      text: "Easy connection with smartphone device",
                    ),
                    const Item(
                      text: "Compatible with all android and ios device",
                    ),
                    const Item(
                      text: "Easy to carry around",
                    ),
                  ],
                )),
            const Gap(34),
          ]),
        ));
  }
}

class Item extends StatelessWidget {
  final String text;
  const Item({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            height: 4,
            width: 4,
            decoration: BoxDecoration(
                color: AppColors.darkGrey, shape: BoxShape.circle),
          ),
          const Gap(8),
          Expanded(
            child: Text(
              text,
              style:
                  subtitle2.copyWith(color: AppColors.darkGrey, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
