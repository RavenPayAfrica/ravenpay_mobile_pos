import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';

class RavenPayBottomSheetCapsule extends StatelessWidget {
  final Color? color;
  const RavenPayBottomSheetCapsule({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 40,
          decoration: BoxDecoration(
            color: color ?? AppColors.lightGrey2,
            borderRadius: BorderRadius.circular(4),
          ),
        )
      ],
    );
  }
}
