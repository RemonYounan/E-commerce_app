import 'package:animations/animations.dart';
import 'package:ecommerce_app/core/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Widget onTap;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      middleColor: Colors.transparent,
      openColor: Colors.transparent,
      openBuilder: (context, action) => onTap,
      closedBuilder: (context, action) => ListTile(
        shape: Border(
          bottom: BorderSide(
              width: 0.25,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.greyDark
                  : AppColors.grey),
        ),
        onTap: action,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        title: Text(
          title,
          style: AppTextStyle.subheadTextStyle(context),
        ),
        subtitle: Text(
          subTitle,
          style: AppTextStyle.helperTextStyle2(context),
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 18,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.greyDark
                : AppColors.grey),
      ),
    );
  }
}
