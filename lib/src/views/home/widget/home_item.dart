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
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          constraints:
              const BoxConstraints(minHeight: 74, maxWidth: double.infinity),
          child: Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.ravenLightGrey4),
                  child: Image.asset(loadAsset(asset), height: 40, width: 40)),
              const Gap(8),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: headling2.copyWith(color: AppColors.ravenPayDark)),
                  Text(subTitile,
                      style: subtitle2.copyWith(color: AppColors.ravenPayDark))
                ],
              ))
            ],
          )),
    );
  }
}
