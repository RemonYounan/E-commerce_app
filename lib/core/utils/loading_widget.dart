import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:ecommerce_app/core/common/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Center(
        child: SpinKitThreeBounce(
          color: color ?? AppColors.primaryColor,
          size: size ?? 35.r,
        ),
      ),
    );
  }
}

showLoadingDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    shape: const CircleBorder(),
    content: SizedBox(
        height: 55.r,
        width: 55.r,
        child: const Center(child: CircularProgressIndicator())),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
