import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  final String pin;
  const GenerateQrCode({super.key, required this.pin});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RavenPayButton(
              buttonText: "Payment Complete",
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
              ],
            ),
            const Gap(24),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Code Generated", style: headling1)),
            const Gap(12),
            Text(
              "Show this Code to an Agent and allow them, approve your payment using this QR Code",
              style: subtitle2.copyWith(fontSize: 14),
            ),
            const Gap(34),
            QrImage(
              data: widget.pin,
              version: QrVersions.auto,
              size: 240.0,
            ),
          ],
        ),
      ),
    );
  }
}
