import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.label,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.maxLength,
  }) : super(key: key);

  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxLength != null ? 85.h : 65.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 8,
            color: AppColors.lightShadowColor,
          ),
        ],
      ),
      child: TextFormField(
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          suffix: suffixIcon,
        ),
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.always,
        style: Theme.of(context).textTheme.labelLarge,
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
