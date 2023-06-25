import 'package:flutter/material.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/views/card_payment/widget/see_how_to_connect.dart';

AppBar ravenPayAppBar({String? howToText}) {
  return AppBar(
    leadingWidth: double.infinity,
    leading: Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
      child: Row(
        children: [
          const RavenPayCloseButton(
            text: "Back",
            isArrow: true,
          ),
          if (howToText != null) ...[
            const Spacer(),
            SeeHowToConnect(
              fontSize: 12,
              text: howToText,
              showIcon: false,
              fontWeight: FontWeight.w600,
            ),
          ]
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
