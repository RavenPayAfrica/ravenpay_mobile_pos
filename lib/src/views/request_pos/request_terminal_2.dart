import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/network/api_requests.dart';
import 'package:mobile_pos/src/shared_widgets/lga_bottom_sheet.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/progress_dialog.dart';
import 'package:mobile_pos/src/shared_widgets/raven_pay_appbar.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_bottomsheet.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_custom_success_page.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_textfeild.dart';
import 'package:mobile_pos/src/shared_widgets/state_of_origin_sheet.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/widget/see_how_to_connect.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RequestTerminal2 extends StatefulWidget {
  const RequestTerminal2({super.key});

  @override
  State<RequestTerminal2> createState() => _RequestTerminal2State();
}

class _RequestTerminal2State extends State<RequestTerminal2> {
  final stateController = TextEditingController();
  final lgaController = TextEditingController();
  final addressController = TextEditingController();
  final landmarkController = TextEditingController();
  DeliveryMethod deliveryMethod = DeliveryMethod.pickup;
  int terminalCount = 1;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                onPressed: () async {
                  bool success = false;
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) => const ProgressDialog(
                            status: 'Processing...',
                          ));
                  switch (deliveryMethod) {
                    case DeliveryMethod.pickup:
                      success = await ApiRequests.requestTerminal(
                          qty: terminalCount, deliveryMethod: deliveryMethod);
                      break;
                    case DeliveryMethod.home_delivery:
                      if (formKey.currentState!.validate()) {
                        success = await ApiRequests.requestTerminal(
                            deliveryMethod: deliveryMethod,
                            qty: terminalCount,
                            address: addressController.text,
                            landmark: landmarkController.text,
                            lga: lgaController.text,
                            state: stateController.text);
                      }
                      break;
                    default:
                  }
                  Navigator.pop(context);

                  if (success) {
                    pushRoute(
                        context,
                        RavenPayCustomSuccessPage(
                          header: "Terminal Requested",
                          subText:
                              "Your terminal request has been approved for ${deliveryMethod.name.replaceAll('_', ' ')} check your terminal tab to see your terminals.",
                        ));
                  }
                },
              ),
              const Gap(24),
              const PoweredByRaven(fontSize: 9),
              const Gap(32),
            ],
          ),
        ),
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
                    if (terminalCount == 1) {
                      return;
                    }
                    terminalCount--;
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
                    terminalCount.toString(),
                    style: subtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    terminalCount++;
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
              children: [
                SeeHowToConnect(
                  fontSize: 12,
                  text:
                      "Amount: NGN${formatAmount((aflliateInfo?.devicePrice ?? 0) * terminalCount)}",
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
                DeliveryItem(
                  value: DeliveryMethod.pickup,
                  currentValue: deliveryMethod,
                  onTap: (index) {
                    deliveryMethod = index;
                    setState(() {});
                  },
                  text: "Pick Up",
                ),
                const Gap(12),
                DeliveryItem(
                  value: DeliveryMethod.home_delivery,
                  currentValue: deliveryMethod,
                  onTap: (index) {
                    deliveryMethod = index;
                    setState(() {});
                  },
                  text: "Deliver to me",
                ),
              ],
            ),
            const Gap(12),
            if (deliveryMethod == DeliveryMethod.pickup) ...[
              const Pickup(),
            ] else ...[
              Form(
                key: formKey,
                child: Column(
                  children: [
                    RavenPayTextField(
                      controller: stateController,
                      readOnly: true,
                      isDropdown: true,
                      labelText: "Select State",
                      hintText: "Choose a state",
                      validator: (data) => validateInput(data,
                          errorMessage: 'State can not be empty'),
                      onTap: () async {
                        var choice = await showRavenPayBottomSheet(context,
                            child: StateOfOriginSheet());

                        if (choice != null) {
                          setState(() {
                            stateController.text = choice;
                          });
                        }
                      },
                    ),
                    const Gap(16),
                    RavenPayTextField(
                      controller: lgaController,
                      readOnly: true,
                      isDropdown: true,
                      labelText: "Select City",
                      hintText: "Choose a city",
                      validator: (data) => validateInput(data,
                          errorMessage: 'City can not be empty'),
                      onTap: () async {
                        if (stateController.text.length < 3) {
                          showSnack(context,
                              'Please select state of residence first');

                          return;
                        }
                        var choice = await showRavenPayBottomSheet(context,
                            child: LGASheet(
                              state: stateController.text,
                            ));

                        // await showCupertinoModalBottomSheet(
                        //     expand: false,
                        //     duration: const Duration(milliseconds: 200),
                        //     context: context,
                        //     builder: (BuildContext context) => Material(
                        //             child: LGASheet(
                        //           state: stateController.text,
                        //         )));

                        if (choice != null) {
                          lgaController.text = choice;
                        }
                      },
                    ),
                    const Gap(16),
                    RavenPayTextField(
                      controller: addressController,
                      labelText: "Your Address",
                      hintText: "Enter your full address",
                      validator: (data) => validateInput(data,
                          errorMessage: 'City can not be empty'),
                    ),
                    const Gap(16),
                    RavenPayTextField(
                      controller: landmarkController,
                      labelText: "Landmark",
                      hintText: "Enter closest landmark",
                      validator: (data) => validateInput(data,
                          errorMessage: 'landmark can not be empty'),
                    ),
                    const Gap(16),
                  ],
                ),
              ),
            ],
            const Gap(34),
          ]),
        ));
  }
}

class DeliveryItem extends StatelessWidget {
  final String text;
  final DeliveryMethod value;
  final DeliveryMethod currentValue;
  final Function(DeliveryMethod) onTap;
  const DeliveryItem(
      {super.key,
      required this.text,
      required this.value,
      required this.onTap,
      required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 34,
          child: Radio(
            value: value,
            groupValue: currentValue,
            onChanged: (val) => onTap(value),
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
                          "Pick up address: ${toBeginningOfSentenceCase(aflliateInfo?.address ?? '')}.",
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
