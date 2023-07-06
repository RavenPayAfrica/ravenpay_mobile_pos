import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/widget/see_how_to_connect.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_textfeild.dart';

import '../../network/api_requests.dart';

class ShareReceipt extends StatefulWidget {
  final String? RRN;
  const ShareReceipt({super.key, this.RRN});

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
              onPressed: () async {

                String refinedPhone = '';

                if (_phoneController.text.length == 10) {
                  refinedPhone = '0' + _phoneController.text;
                }
                else{
                  refinedPhone = _phoneController.text;
                }

                var result = await  ApiRequests.sendReceipts(context, refinedPhone, widget.RRN);

                if(result){
                  showSnack(context, 'Receipt was sent successfully');
                   toRavenPayHome(context);
                }
                else{
                  showSnack(context, 'Unable to sent receipt at the moment');
                }

              },
            ),
            const Gap(24),
            const PoweredByRaven(fontSize: 9),
            const Gap(24),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        child: Column(
          children: [
            const Gap(24),
            Row(
              children: const [
                RavenPayCloseButton(
                  text: "",
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
                child: Text("Share to WhatsApp", style: headling1)),
            const Gap(12),
            RichText(
                text: TextSpan(
                    text:
                        "Add your customer WhatsApp number to share this receipt to them directly.",
                    style: subtitle2.copyWith(fontSize: 14),
                    children: [
                  // TextSpan(
                  //   text: " see Instruction above",
                  //   style: subtitle2.copyWith(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 14,
                  //       color: pluginTheme.secondaryColor),
                  // )
                ])),
            const Gap(40),
            RavenPayTextField(
              counterText: '',
              maxLength: 11,
              inputType: TextInputType.phone,
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
