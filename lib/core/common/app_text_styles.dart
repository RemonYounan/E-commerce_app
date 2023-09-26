import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  /// `Font Size = 31` |
  /// `Font Weight = Bold`
  static TextStyle headlineTextStyle1(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 31.sp,
      fontWeight: FontWeight.bold,
    );
  }

  /// `Font Size = 23` |
  /// `Font Weight = Bold`
  static TextStyle headlineTextStyle2(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 23.sp,
      fontWeight: FontWeight.bold,
    );
  }

  /// `Font Size = 17` |
  /// `Font Weight = Bold`
  static TextStyle headlineTextStyle3(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 17.sp,
      fontWeight: FontWeight.bold,
    );
  }

  /// `Font Size = 15` |
  /// `Font Weight = Bold`
  static TextStyle subheadTextStyle(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
    );
  }

  /// `Font Size = 15` |
  /// `Font Weight = Normal`
  static TextStyle titleNormalTextStyle(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
    );
  }

  /// `Font Size = 15` |
  /// `Font Weight = Normal`
  static TextStyle titleNormalTextStyle2(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
    );
  }

  /// `Font Size = 14` |
  /// `Font Weight = Medium`
  static TextStyle titleMediumTextStyle(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  /// `Font Size = 15` |
  /// `Font Weight = Bold`
  static TextStyle captionBoldTextStyle(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
    );
  }

  /// `Font Size = 15` |
  /// `Font Weight = Normal`
  static TextStyle captionNormalTextStyle(BuildContext context,
      {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
    );
  }

  /// `Font Size = 11` |
  /// `Font Weight = Normal`
  static TextStyle helperTextStyle1(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.whiteDark : AppColors.lightBlack),
      fontSize: 11.sp,
      fontWeight: FontWeight.normal,
    );
  }

  /// `Font Size = 11` |
  /// `Font Weight = Normal` |
  /// `Color = Gray`
  static TextStyle helperTextStyle2(BuildContext context, {Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDark ? AppColors.greyDark : AppColors.grey),
      fontSize: 11.sp,
      fontWeight: FontWeight.normal,
    );
  }
}
