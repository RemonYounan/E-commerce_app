import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      shape: Border(
        bottom: BorderSide(
            width: 0.25,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.greyDark
                : AppColors.grey),
      ),
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
      title: Text(
        title,
        style: textTheme.titleLarge,
      ),
      subtitle: Text(
        subTitle,
        style: textTheme.labelSmall,
      ),
      trailing: Icon(Icons.arrow_forward_ios,
          size: 18,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.greyDark
              : AppColors.grey),
    );
  }
}
