import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    Key? key,
    required this.imgPath,
    required this.title,
    this.discription,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final String? discription;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: AnimationLimiter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AnimationConfiguration.toStaggeredList(
            childAnimationBuilder: (child) => ScaleAnimation(
              duration: const Duration(milliseconds: 350),
              delay: const Duration(milliseconds: 50),
              child: FadeInAnimation(
                child: child,
              ),
            ),
            children: [
              SvgPicture.asset(
                imgPath,
                height: 180.r,
                width: 180.r,
              ),
              SizedBox(height: 20.h),
              Text(
                title,
                style: AppTextStyle.headlineTextStyle2(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              if (discription != null)
                Text(
                  discription!,
                  style: AppTextStyle.titleMediumTextStyle(context).copyWith(
                      color: isDark ? AppColors.greyDark : AppColors.grey),
                  textAlign: TextAlign.center,
                )
            ],
          ),
        ),
      ),
    );
  }
}
