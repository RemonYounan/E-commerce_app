import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:flutter/material.dart';

showErrorToast(BuildContext context, String title) {
  fToast.init(context);
  showToast(context: context, title: title, color: AppColors.errorColor);
}
