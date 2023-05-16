import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/mobile_pos.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class RavenPayCloseButton extends StatelessWidget {
  final bool isArrow;
  final String text;
  const RavenPayCloseButton({
    super.key,
    this.text = "Close",
    this.isArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isArrow) {
          RavenMobilePOS.close(context);
          return;
        }
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff333333).withOpacity(0.06),
                        spreadRadius: 2,
                        offset: const Offset(2, 2),
                        blurRadius: 2)
                  ],
                  shape: BoxShape.circle,
                  color: pluginTheme.onPrimary!.withOpacity(0.2)),
              child: Image.asset(
                  loadAsset(isArrow ? "arrow_back.png" : "close_icon.png"),
                  color: isArrow ? null : pluginTheme.onPrimary)),
          const Gap(12),
          Text(
            text,
            style: subtitle.copyWith(
                color: isArrow ? null : pluginTheme.onPrimary),
          )
        ],
      ),
    );
  }
}
