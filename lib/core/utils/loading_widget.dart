// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Center(
        child: SpinKitThreeBounce(
          color: color ?? AppColors.primaryColor,
          size: 35.r,
        ),
      ),
    );
  }
}
