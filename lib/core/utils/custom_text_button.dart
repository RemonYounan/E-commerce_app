// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

import '../common/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        alignment: Alignment.center,
        textStyle: AppTextStyle.titleMediumTextStyle(context).copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(title),
    );
  }
}
