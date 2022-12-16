// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/common/app_colors.dart';

class SignWithIcon extends StatelessWidget {
  const SignWithIcon({
    Key? key,
    required this.path,
    required this.onTap,
  }) : super(key: key);
  final String path;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        height: 68.h,
        width: 92.w,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            offset: const Offset(0, 1),
            blurRadius: 8,
          )
        ], color: AppColors.white, borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 20.h),
          child: SvgPicture.asset(path),
        ),
      ),
    );
  }
}
