import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/ui/card_payment/card_success_page.dart';
import 'package:mobile_pos/src/ui/card_payment/widget/see_how_to_connect.dart';
import 'package:mobile_pos/src/ui/pay_with_code/widgets/business_details_table.dart';
import 'package:mobile_pos/src/widget/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/widget/ravenpay_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_close_button.dart';
import 'package:mobile_pos/src/widget/ravenpay_scaffold.dart';

class ConfirmBusinessDetails extends StatefulWidget {
  const ConfirmBusinessDetails({super.key});

  @override
  State<ConfirmBusinessDetails> createState() => _ConfirmBusinessDetailsState();
}

class _ConfirmBusinessDetailsState extends State<ConfirmBusinessDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: RavenPayScaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RavenPayButton(
                  buttonText: "Proceed",
                  onPressed: () {
                    pushRoute(context, const CardSuccessPage());
                  },
                ),
                const Gap(24),
                const PoweredByRaven(fontSize: 9),
                const Gap(24),
              ],
            ),
          ),
          showLogo: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
            child: Column(
              children: [
                const Gap(24),
                Row(
                  children: const [
                    RavenPayCloseButton(
                      text: "Back",
                      isArrow: true,
                    ),
                    Spacer(),
                    SeeHowToConnect(
                      text: "How it works",
                      showIcon: false,
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                ),
                const Gap(24),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Confirm business details", style: headling1)),
                const Gap(12),
                RichText(
                    text: TextSpan(
                        text:
                            "Pay-code allows merchants receive payment using your terminal.  ",
                        style: subtitle2.copyWith(fontSize: 14),
                        children: [
                      TextSpan(
                        text: "see Instruction above",
                        style: subtitle2.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.ravenOrageColor),
                      )
                    ])),
                const Gap(24),
                const BusinessDetailsTable(
                  items: [
                    BusinessDetailsTableItem(
                        name: "Merchant Name:", value: "Wanogho Confidence"),
                    BusinessDetailsTableItem(
                        name: "Merchant Email:",
                        value: "business@sendcheap.ng"),
                    BusinessDetailsTableItem(
                        name: "Merchant Phone:", value: "+2347017215143"),
                    BusinessDetailsTableItem(
                        name: "Business Type:", value: "Agents")
                  ],
                )
              ],
            ),
          )),
    );
  }
}
