import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:pinput/pinput.dart';

class RavenPayPinWidget extends StatelessWidget {
  const RavenPayPinWidget({
    Key? key,
    this.pinController,
    this.onSubmit,
    this.onChanged,
    this.color,
    this.onComplete,
    this.pinLength = 4,
    this.autoFocus = false,
    this.useNativeKeypad = false,
    this.showCursor = false,
  }) : super(key: key);

  final TextEditingController? pinController;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final void Function(String)? onComplete;
  final bool? useNativeKeypad;
  final bool? autoFocus;
  final int? pinLength;
  final bool? showCursor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      decoration: BoxDecoration(
          color: AppColors.lightGrey2.withOpacity(0.4),
          borderRadius: BorderRadius.circular(34)),
      width: 144,
      child: Pinput(
        obscureText: true,
        submittedPinTheme: PinTheme(
          width: 12,
          decoration: BoxDecoration(
            color: color ?? Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        defaultPinTheme: PinTheme(
          width: 16,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xffE5E6E6), width: .5),
          ),
        ),
        separator: const SizedBox(
          width: 10,
        ),
        onCompleted: onComplete,
        useNativeKeyboard: useNativeKeypad ?? false,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        length: pinLength ?? 4,
        pinContentAlignment: Alignment.center,
        keyboardType: TextInputType.number,
        controller: pinController,
        showCursor: showCursor ?? false,
        autofocus: autoFocus ?? false,
      ),
    );
  }
}
