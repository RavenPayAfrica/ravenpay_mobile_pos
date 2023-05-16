import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/mobile_pos_platform_interface.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/models/success_response.dart';
import 'package:mobile_pos/src/network/api_requests.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/card_success_page.dart';
import 'package:mobile_pos/src/views/card_payment/widget/see_how_to_connect.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_card.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class ConnectDevice extends StatefulWidget {
  const ConnectDevice({super.key, required this.amount});

  final double amount;

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
                onPressed: () async {
                  if (currentIndex == 1) {
                    final cardData = await MobilePosPlatform.instance
                        .chargeCard(
                            amount: widget.amount,
                            connectivityType: ConnectivityType.bluetooth);
                    if (cardData != null) {
                      if (MobilePosPlatform.instance.config!.isStaging) {
                        //Mock Successful
                        pushRoute(
                            context,
                            CardSuccessPage(
                              amount: widget.amount,
                              response: RavenMPOSResponse(),
                            ));
                      } else {
                        //charge card
                        try {
                          final res = await ApiRequest.processCard(
                              context, widget.amount, cardData);
                          MobilePosPlatform.instance.config?.onSuccess
                              .call(res);
                        } on RavenMobilePOSException catch (e) {
                          MobilePosPlatform.instance.config?.onError.call(e);
                        }
                      }
                    } else {
                      MobilePosPlatform.instance.config?.onError.call(
                          RavenMobilePOSException(
                              code: kNibbsError, message: 'Payment failed'));
                    }
                  } else if (currentIndex == 2) {
                    await MobilePosPlatform.instance.chargeCard(
                        amount: widget.amount,
                        connectivityType: ConnectivityType.otg);
                  }
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
                  activeColor: pluginTheme.primaryColor,
                  value: currentIndex,
                  groupValue: index,
                  onChanged: (val) {}),
              RavenPayText.bodyText(
                name,
                fontSize: 14,
                color: pluginTheme.primaryColor,
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
