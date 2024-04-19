import 'package:flutter/material.dart';
import 'package:sound_africa/resources/managers/color_manager.dart';
import 'package:sound_africa/resources/managers/styles_manager.dart';
import 'package:sound_africa/resources/managers/values_manager.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextAlign? textAlign;
  final int maxLines;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final Color? filledColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final FontWeight fontWeight;
  final bool filled;
  final TextStyle? style;
  final double? btnWidth;
  final double? borderWidth;
  final Color? borderColor;
  final bool readOnly;

  const CustomTextField({
    super.key,
    this.hintText,
    this.textAlign,
    this.readOnly = false,
    this.keyboardType,
    this.filled = true,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.onTap,
    this.borderRadius,
    this.filledColor,
    this.fontWeight = FontWeight.w400,
    this.style,
    this.btnWidth,
    this.borderWidth,
    this.borderColor,
    this.suffixIcon,
    this.hintStyle,
    this.focusedBorderColor,
    this.enabledBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: AppSize.s60,
          width: btnWidth ?? double.infinity,
          child: TextFormField(
            onTap: onTap,
            maxLines: maxLines,
            textInputAction: TextInputAction.done,
            style: style ?? AppTextStyle.bodyStyle,
            autovalidateMode: autoValidateMode,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.white,
                  width: borderWidth ?? 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusedBorderColor ?? ash10Color,
                  width: 0.7,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: enabledBorderColor ?? ash10Color,
                  width: 0.7,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppSize.s12,
                horizontal: AppSize.s14,
              ),
              hintText: hintText,
              hintStyle: hintStyle ?? AppTextStyle.bodyStyle400,
              suffixIcon: suffixIcon,
              filled: filled,
              fillColor: Colors.transparent,
            ),
            controller: controller,
            textAlign: textAlign ?? TextAlign.start,
            keyboardType: keyboardType,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
