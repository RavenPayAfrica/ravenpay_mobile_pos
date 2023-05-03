import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/ui/card_payment/connect_bluetooth.dart';
import 'package:mobile_pos/src/ui/card_payment/connect_otg.dart';
import 'package:mobile_pos/src/ui/card_payment/widget/see_how_to_connect.dart';
import 'package:mobile_pos/src/widget/ravenpay_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_card.dart';
import 'package:mobile_pos/src/widget/ravenpay_close_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class ConnectDevice extends StatefulWidget {
  const ConnectDevice({super.key});

  @override
  State<ConnectDevice> createState() => _ConnectDeviceState();
}

class _ConnectDeviceState extends State<ConnectDevice> {
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
                    "Connect Device",
                    fontSize: 20,
                  )),
              const Gap(24),
              RavenPayCard(
                  child: Column(
                children: [
                  Items(
                    currentIndex: currentIndex,
                    name: "Bluetooth",
                    index: 1,
                    onPressed: (val) {
                      currentIndex = val;
                      setState(() {});
                    },
                  ),
                  const Divider(
                    height: 1,
                  ),
                  Items(
                      currentIndex: currentIndex,
                      name: "OTG Device Cord",
                      index: 2,
                      onPressed: (val) {
                        currentIndex = val;
                        setState(() {});
                      }),
                ],
              )),
              const Gap(34),
              RavenPayButton(
                enabled: currentIndex != 0,
                buttonText: "Proceed",
                onPressed: () {
                  pushRoute(
                      context,
                      currentIndex == 1
                          ? const ConnectBluetooth()
                          : const ConnectOtg());
                },
              )
            ],
          ),
        ));
  }
}

class Items extends StatelessWidget {
  final String name;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;
  Items({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
    required this.name,
  });

  List<String> bluetoothItems = [
    "Ensure your bluetooth is active ",
    "Ensure the Terminal is on",
    "Find the device and connect ",
    "Once connected proceed to add a PIN"
  ];

  List<String> otgItems = [
    "Ensure you have your OTG Cable available",
    "Ensure the terminal is on",
    "Insert your OTG to your phone and the terminal",
    "Once connected proceed to add a PIN"
  ];

  @override
  Widget build(BuildContext context) {
    var items = index == 1 ? bluetoothItems : otgItems;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onPressed(index),
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
          if (index == currentIndex) ...[
            const Gap(8),
            ...items.map((e) => Row(
                  children: [
                    const Gap(24),
                    Container(
                      height: 28,
                      width: 4,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.ravenPayGrey3),
                    ),
                    const Gap(8),
                    Expanded(
                      child: Text(
                        e,
                        style: subtitle2.copyWith(fontSize: 14),
                      ),
                    )
                  ],
                )),
            const Gap(12),
          ]
        ],
      ),
    );
  }
}
