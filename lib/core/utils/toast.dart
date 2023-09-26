import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FToast fToast = FToast();
showToast({
  required BuildContext context,
  Widget? child,
  Color? color,
  String? title,
  Duration? duration,
}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: color ?? AppColors.dark,
    ),
    child: child ??
        Text(
          title!,
          style: AppTextStyle.helperTextStyle2(context)
              .copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: duration ?? const Duration(seconds: 2),
  );
}
