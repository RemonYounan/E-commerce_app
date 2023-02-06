import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlaceholderLoadingWidget extends StatelessWidget {
  const PlaceholderLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 100,
      width: 100,
      child: const SpinKitFadingCircle(
        color: AppColors.primaryColor,
        size: 30,
      ),
    );
  }
}
