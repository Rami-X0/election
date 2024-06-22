import 'package:elections/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final double? hintTextSize;
  final Widget? labelText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius = 16;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final Function(String?) validator;
  final Function()? onEditingComplete;
  final TextEditingController? controller;
  final int? maxLine;
  final int? minLines;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.hintTextSize,
    this.labelText,
    this.suffixIcon,
    this.contentPadding,
    this.obscureText,
    required this.validator,
    required this.controller,
    this.keyboardType,
    this.textInputAction,
    this.autoFocus,
    this.onEditingComplete,
    this.maxLine,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus ?? false,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onEditingComplete: () {
        onEditingComplete?.call();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      maxLines: maxLine ?? 1,
      minLines: minLines ?? 1,
      obscureText: obscureText ?? false,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 17,
              horizontal: 20,
            ),
        label: labelText,
        hintStyle: TextStyle(
          fontSize: hintTextSize
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: ColorsManager.lightGray,
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: ColorsManager.mainColor,
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 19.h,
            horizontal: 20.w,
          ),
          child: suffixIcon,
        ),
        isDense: true,
        filled: true,
        fillColor: ColorsManager.mainColor.withOpacity(0.1),
      ),
    );
  }
}