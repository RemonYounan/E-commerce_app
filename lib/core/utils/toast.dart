import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FToast fToast = FToast();
showToast(
    {required BuildContext context,
    Widget? child,
    Color? color,
    String? title}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: color,
    ),
    child: child ??
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.white),
        ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
