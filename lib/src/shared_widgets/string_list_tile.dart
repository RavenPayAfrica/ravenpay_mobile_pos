import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class StringListTile extends StatelessWidget {
  final String? title;

  const StringListTile({this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, title);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          //border: Border.all(width: 0.5, color: BrandColors.colorLightGray),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text(
                title ?? '',
                style: subtitle2.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
