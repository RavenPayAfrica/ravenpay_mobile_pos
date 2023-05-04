import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class RavenPayAmountPad extends StatelessWidget {
  final String amount;
  final int? length;
  final Function(String) onChange;

  const RavenPayAmountPad({
    super.key,
    required this.amount,
    this.length,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [item("1"), item("2"), item("3")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [item("4"), item("5"), item("6")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [item("7"), item("8"), item("9")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () => valueChanged("$amount."),
                  child: SizedBox(
                    child: Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            color: AppColors.ravenPayDark,
                            shape: BoxShape.circle)),
                  )),
            ),
            item("0"),
            Expanded(
              child: InkWell(
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () async {
                    delete();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Image.asset(
                        loadAsset("arrow_back.png"),
                        color: AppColors.ravenPayDark,
                        height: 18,
                        width: 18,
                      ),
                    ),
                  )),
            ),
            const Gap(12),
          ],
        )
      ],
    ));
  }

  void delete() {
    if (amount.isNotEmpty) {
      onChange(amount.substring(0, amount.length - 1));
    }
  }

  void valueChanged(String val) {
    if (length != null && amount.length >= length!) {
      return;
    }
    onChange(val);
  }

  Widget item(String value) {
    return Expanded(
        child: InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () async {
        valueChanged(amount + value);
      },
      child: Container(
        height: 80,
        alignment: Alignment.center,
        child: RavenPayText.heading(
          value,
          color: AppColors.ravenPayDark,
          align: TextAlign.center,
        ),
      ),
    ));
  }
}