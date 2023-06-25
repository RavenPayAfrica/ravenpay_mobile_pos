import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_custom_success_page.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_textfeild.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/widget/see_how_to_connect.dart';

class RequestTerminal2 extends StatefulWidget {
  const RequestTerminal2({super.key});

  @override
  State<RequestTerminal2> createState() => _RequestTerminal2State();
}

class _RequestTerminal2State extends State<RequestTerminal2> {
  int currentIndex = 1;
  int purchaseNo = 1;
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: double.infinity,
          leading: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
            child: Row(
              children: const [
                RavenPayCloseButton(
                  text: "Back",
                  isArrow: true,
                ),
                Spacer(),
                SeeHowToConnect(
                  fontSize: 12,
                  text: "Track your Terminal",
                  showIcon: false,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RavenPayButton(
                buttonText: "Proceed",
                onPressed: () {
                  pushRoute(
                      context,
                      const RavenPayCustomSuccessPage(
                        header: "Terminal Requested",
                        subText:
                            "Your terminal request has been approved for delivery check your terminal tab to see your terminals.",
                      ));
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Select a quantity",
                  style: subtitle2.copyWith(fontSize: 13)),
            ),
            const Gap(8),
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.ravenGrey4)),
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    if (purchaseNo == 1) {
                      return;
                    }
                    purchaseNo--;
                    setState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    width: 60,
                    color: AppColors.ravenGrey4,
                    child: const Icon(Icons.remove, size: 18),
                  ),
                ),
                Expanded(
                  child: Text(
                    purchaseNo.toString(),
                    style: subtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    purchaseNo++;
                    setState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    width: 60,
                    color: AppColors.ravenGrey4,
                    child: const Icon(Icons.add, size: 18),
                  ),
                )
              ]),
            ),
            const Gap(16),
            Row(
              children: const [
                SeeHowToConnect(
                  fontSize: 12,
                  text: "Terminal Price: N20,000.00",
                  showIcon: false,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Gap(24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select delivery method",
                style: subtitle2.copyWith(fontSize: 14),
              ),
            ),
            Row(
              children: [
                Item(
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    currentIndex = index;
                    setState(() {});
                  },
                  text: "Pick Up",
                ),
                const Gap(12),
                Item(
                  index: 2,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    currentIndex = index;
                    setState(() {});
                  },
                  text: "Deliver to me",
                ),
              ],
            ),
            const Gap(12),
            if (currentIndex == 1) ...[
              const Pickup(),
            ] else ...[
              const RavenPayTextField(
                readOnly: true,
                isDropdown: true,
                labelText: "Select State",
                hintText: "Choose a State",
              ),
              const Gap(12),
              const RavenPayTextField(
                readOnly: true,
                isDropdown: true,
                labelText: "Select City",
                hintText: "Choose a City",
              ),
              const Gap(12),
              const RavenPayTextField(
                labelText: "Your Address",
                hintText: "Your Address Location",
              ),
              const Gap(12),
            ],
            const Gap(34),
          ]),
        ));
  }
}

class Item extends StatelessWidget {
  final String text;
  final index;
  final currentIndex;
  final Function(int) onTap;
  const Item(
      {super.key,
      required this.text,
      required this.index,
      required this.onTap,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 34,
          child: Radio(
            value: index,
            groupValue: currentIndex,
            onChanged: (val) => onTap(index),
            activeColor: pluginTheme.primaryColor,
          ),
        ),
        Text(
          text,
          style: subtitle2.copyWith(fontSize: 13, color: AppColors.ravenDark),
        )
      ],
    );
  }
}

class Pickup extends StatelessWidget {
  const Pickup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.lightOragen),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  color: AppColors.ravenOrageColor,
                  size: 16,
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pick up address: 20 The Quad Layi Yusuf off Admiralty way. Lekki  Lagos Nigeria.",
                          style: subtitle2.copyWith(
                              color: AppColors.ravenPayGrey3,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.5,
                              fontFamily: "br_light"),
                        ),
                        const Gap(2),
                        Text("Business Hours: 8:00am - 5:00pm",
                            style: subtitle.copyWith(
                                fontSize: 13,
                                wordSpacing: 1,
                                fontFamily: "br_bold",
                                color: AppColors.ravenDark))
                      ]),
                ),
              ],
            ),
          ],
        ));
  }
}
