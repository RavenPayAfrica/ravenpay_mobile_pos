import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/widget/see_how_to_connect.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_textfeild.dart';

class ShareReceipt extends StatefulWidget {
  const ShareReceipt({super.key});

  @override
  State<ShareReceipt> createState() => _ShareReceiptState();
}

class _ShareReceiptState extends State<ShareReceipt> {
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RavenPayButton(
              enabled: _phoneController.text.length > 9,
              buttonText: "Proceed",
              onPressed: () {
                toRavenPayHome(context);
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
                  text: "Phone Number Policy",
                  showIcon: false,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const Gap(24),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Share to Whatsapp", style: headling1)),
            const Gap(12),
            RichText(
                text: TextSpan(
                    text:
                        "Add your customer WhatsApp number to share this receipt to them directly.",
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
            RavenPayTextField(
              controller: _phoneController,
              isPhone: true,
              onChanged: (val) {
                setState(() {});
              },
              labelText: "Phone Number",
            ),
          ],
        ),
      ),
    );
  }
}
