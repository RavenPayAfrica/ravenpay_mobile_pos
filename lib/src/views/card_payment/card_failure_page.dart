import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/card_payment/share_receipt.dart';

class CardFailurePage extends StatelessWidget {
  const CardFailurePage({super.key, this.reason});
  final String? reason;

  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        bottomNavigationBar: Container(
          height: 94,
          decoration: BoxDecoration(
              color: Color(0xFFF7F8F7),
              border: Border(top: BorderSide(color: Color(0xFFCCCCCC)))),
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  pushRoute(context, ShareReceipt());
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border:
                          Border(right: BorderSide(color: Color(0xFFCCCCCC)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(loadAsset('share.png'))),
                      Gap(8),
                      Text('Share Receipt')
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border:
                          Border(right: BorderSide(color: Color(0xFFCCCCCC)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            loadAsset('close_icon.png'),
                            color: Colors.black,
                          )),
                      Gap(8),
                      Text('Close')
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 124,
                height: 124,
                child: Image.asset(loadAsset('warning_red.png'))),
            // Gap(8),
            Text(
              'Payment Failed',
              textAlign: TextAlign.center,
              style: headling1.copyWith(fontSize: 22),
            ),
            Gap(4),
            Text(
              reason ??
                  'There was an issue charging your card for this transaction.',
              style: subtitle.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
