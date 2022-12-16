import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    Key? key,
    required this.rate,
  }) : super(key: key);
  final int rate;
  @override
  Widget build(BuildContext context) {
    final rateWidgets = [
      ...List.generate(
        rate,
        (_) => Icon(
          Icons.star_rounded,
          color: AppColors.amber,
          size: 21.r,
        ),
      ),
      ...List.generate(
        5 - rate,
        (_) => Icon(
          Icons.star_border_rounded,
          color: AppColors.grey,
          size: 21.r,
        ),
      ),
    ];
    return Row(children: rateWidgets);
  }
}
