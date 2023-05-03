// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class RavenPayTextField extends StatefulWidget {
  const RavenPayTextField({
    Key? key,
    this.controller,
    this.enabled = true,
    this.autoFocus = false,
    this.inputType,
    this.autofillHints,
    this.inputAction,
    this.focusNode,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.labelText = '',
    this.suffixIcon,
    this.preffixIcon,
    this.isPhone = false,
    this.validator,
    this.onTap,
    this.inputFormatters,
    this.onChanged,
    this.hintStyle,
    this.readOnly = false,
    this.isRequiredField = false,
    this.onSaved,
    this.isPasswordField = false,
    this.obscure = false,
    this.hintText = '',
    this.textCapitalization = TextCapitalization.none,
    this.counterText,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool isPhone;
  final bool enabled;
  final bool autoFocus;
  final List<String>? autofillHints;
  final bool obscure;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSaved;
  final bool isRequiredField;
  final bool isPasswordField;
  final TextStyle? hintStyle;
  final String? counterText;

  @override
  _RavenPayTextFieldState createState() => _RavenPayTextFieldState();
}

class _RavenPayTextFieldState extends State<RavenPayTextField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.labelText,
              style: subtitle.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          minLines: widget.minLines,
          inputFormatters: widget.inputFormatters,
          style: subtitle2.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.ravenDarkGreen,
          ),
          obscureText: obscure,
          keyboardType: widget.inputType,
          enabled: widget.enabled,
          maxLength: widget.maxLength,
          maxLines: widget.isPasswordField ? 1 : widget.maxLines,
          controller: widget.controller,
          textInputAction: widget.inputAction,
          textCapitalization: widget.textCapitalization!,
          decoration: InputDecoration(
            counterText: widget.counterText,
            prefixIcon: widget.isPhone ? phonePreffix() : widget.preffixIcon,
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 50,
              maxWidth: 70,
            ),
            fillColor: const Color(0xffF9F9F9),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            hintStyle: widget.hintStyle ??
                subtitle2.copyWith(
                  color: AppColors.ravenPayGrey4,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
            hintText: widget.isPasswordField
                ? widget.hintText.isEmpty
                    ? '*********'
                    : widget.hintText
                : widget.hintText,
            errorStyle: const TextStyle(color: Colors.red),
            counterStyle: subtitle2.copyWith(fontWeight: FontWeight.w600),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: AppColors.ravenDarkGreen, width: .8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.ravenPayGrey.withOpacity(.3),
                width: .8,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffF9F9F9),
                width: 1.2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red[300]!, width: 1.2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red[300]!, width: 1.2),
            ),
          ),
        )
      ],
    );
  }

  Widget phonePreffix() {
    return Container(
        padding: const EdgeInsets.only(bottom: 4),
        margin: const EdgeInsets.only(right: 8),
        width: 94,
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: AppColors.ravenPayGrey2))),
        child: Row(children: [
          const Gap(14),
          Image.asset(
            loadAsset("ngn_icon.png"),
            height: 24,
            width: 24,
          ),
          const Gap(4),
          Text("+234",
              style: subtitle.copyWith(
                  color: AppColors.ravenPayDark, fontWeight: FontWeight.w500))
        ]));
  }
}
