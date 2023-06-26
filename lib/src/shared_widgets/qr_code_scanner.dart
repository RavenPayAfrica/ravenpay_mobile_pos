import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
// import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class RavenPayQRCodeSCanner extends StatefulWidget {
  const RavenPayQRCodeSCanner({Key? key, required this.onDataCapture})
      : super(key: key);
  final Function(String) onDataCapture;

  @override
  State<RavenPayQRCodeSCanner> createState() => _RavenPayQRCodeSCannerState();
}

class _RavenPayQRCodeSCannerState extends State<RavenPayQRCodeSCanner> {
  String translatorPage = "global_widget";
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
      showLogo: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        child: Column(
          children: [
            const Gap(24),
            const RavenPayCloseButton(
              text: "Back",
              isArrow: true,
            ),
            const Gap(24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Scan QRCode",
                style: headling1,
              ),
            ),
            const Gap(8),
            Text(
                "Ask customer to use the secure PIN share option to generate a QR code. Place the generated image behind your phone and scan.",
                style: subtitle2.copyWith(fontSize: 14)),
            const Gap(28),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: MobileScanner(onDetect: (data) {
                  final barcode = data.barcodes[0];
                  if (barcode.rawValue == null) {
                    showSnack(context, 'Could not scan image');
                  } else {
                    final String code = barcode.rawValue ?? '';
                    widget.onDataCapture(code);
                  }
                }),
              ),
            ),
            const Gap(32),
            PoweredByRaven(),
            Gap(32)
          ],
        ),
      ),
    );
  }
}
