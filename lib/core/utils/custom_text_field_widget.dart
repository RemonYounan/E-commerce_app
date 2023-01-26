import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({
    Key? key,
    required this.label,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
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
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
        ),
        style: Theme.of(context).textTheme.labelLarge,
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
