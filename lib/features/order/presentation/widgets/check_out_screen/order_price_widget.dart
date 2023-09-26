import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/app_text_styles.dart';

class OrderPriceWidget extends StatelessWidget {
  const OrderPriceWidget({
    super.key,
    required this.title,
    required this.value,
    this.style,
  });

  final String title;
  final int value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style ??
              AppTextStyle.titleMediumTextStyle(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: isDark ? AppColors.greyDark : AppColors.grey),
        ),
        Text(
          '$value\$',
          style: AppTextStyle.headlineTextStyle3(context),
        ),
      ],
    );
  }
}
