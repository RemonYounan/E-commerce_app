import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common/app_colors.dart';

final FToast fToast = FToast();
showToast(String? text,Color? color) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color:color,
    ),
    child: Text(
      text!,
      style: const TextStyle(color: AppColors.white),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
