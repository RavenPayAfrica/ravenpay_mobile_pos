import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/ui/card_payment/insert_card.dart';
import 'package:mobile_pos/src/ui/card_payment/widget/see_how_to_connect.dart';
import 'package:mobile_pos/src/widget/ravenpay_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_card.dart';
import 'package:mobile_pos/src/widget/ravenpay_close_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class ConnectBluetooth extends StatefulWidget {
  const ConnectBluetooth({super.key});

  @override
  State<ConnectBluetooth> createState() => _ConnectBluetoothState();
}

class _ConnectBluetoothState extends State<ConnectBluetooth> {
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
                    "Connect Bluetooth",
                    fontSize: 20,
                  )),
              const Gap(24),
              Image.asset(
                loadAsset("bluetooth_search.png"),
                height: 140,
              ),
              Text(
                "Searching for device...",
                style: subtitle.copyWith(color: AppColors.ravenDarkGreen),
              ),
              const Spacer(),
              RavenPayCard(
                  padding: EdgeInsets.zero,
                  height: 180,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return ItemView(
                        currentIndex: currentIndex,
                        name: "Oraimo Prisma 13",
                        index: index,
                        onPressed: (val) {
                          currentIndex = val;
                          setState(() {});
                        });
                  })),
              const Gap(34),
              RavenPayButton(
                buttonText: "Proceed",
                onPressed: () {
                  pushRoute(context, const InsertCard());
                },
              ),
              const Gap(74),
            ],
          ),
        ));
  }
}

class ItemView extends StatelessWidget {
  final String name;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;
  const ItemView({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onPressed(index),
      child: Container(
        padding: const EdgeInsets.only(bottom: 8, top: 4),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: AppColors.ravenPayGrey2.withOpacity(0.5)))),
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                    activeColor: AppColors.ravenDarkGreen,
                    value: currentIndex,
                    groupValue: index,
                    onChanged: (val) {}),
                RavenPayText.bodyText(
                  name,
                  fontSize: 14,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
