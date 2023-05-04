import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class HomeItem extends StatelessWidget {
  final String title;
  final String subTitile;
  final String asset;
  final Function? onTap;
  const HomeItem({
    required this.asset,
    required this.subTitile,
    this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          constraints:
              const BoxConstraints(minHeight: 74, maxWidth: double.infinity),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: AppColors.ravenPayGrey2.withOpacity(0.8),
                spreadRadius: 0.2,
                blurRadius: 0.1)
          ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Image.asset(loadAsset(asset), height: 40, width: 40),
              const Gap(8),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: headling2),
                  Text(subTitile, style: subtitle2)
                ],
              ))
            ],
          )),
    );
  }
}
