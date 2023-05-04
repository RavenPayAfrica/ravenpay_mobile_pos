import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button_loader.dart';

enum ButtonIconPosition { left, right }

class RavenPayButton extends StatelessWidget {
  const RavenPayButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
    this.textColor = Colors.white,
    this.busy = false,
    this.buttonColor,
    this.borderColor,
    this.height = 58,
    this.enabled = true,
    this.fontSize,
    this.fontWeight,
    this.showIcon = false,
    this.borderRadius = 8,
    this.buttonIconPosition = ButtonIconPosition.right,
    this.icon,
  }) : super(key: key);
  final String buttonText;
  final void Function()? onPressed;
  final Widget? icon;
  final bool busy;
  final Color? buttonColor;
  final Color? borderColor;
  final Color textColor;
  final bool enabled;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool showIcon;
  final double borderRadius;
  final ButtonIconPosition buttonIconPosition;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      color: enabled
          ? (buttonColor ?? AppColors.ravenDarkGreen)
          : AppColors.ravenDarkGreen.withOpacity(.4),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: enabled ? onPressed : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          height: height,
          child: Center(
              child: busy
                  ? RavenButtonLoader(
                      color: textColor,
                      size: 30,
                    )
                  : Text(buttonText,
                      style: subtitle.copyWith(color: textColor))),
        ),
      ),
    );
  }
}
