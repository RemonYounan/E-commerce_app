import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';

class OrderInfoItemWidget extends StatelessWidget {
  const OrderInfoItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: isDark ? AppColors.greyDark : AppColors.grey,
                  ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
