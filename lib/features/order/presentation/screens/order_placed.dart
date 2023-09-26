import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/app_text_styles.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.bags),
            SizedBox(height: 50.h),
            Text(
              AppStrings.success,
              style: AppTextStyle.headlineTextStyle1(context),
            ),
            Text(
              AppStrings.orderSuccess,
              style: AppTextStyle.titleNormalTextStyle2(context),
            ),
            Text(
              AppStrings.thankYou,
              style: AppTextStyle.titleNormalTextStyle2(context),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
        child: CustomButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.main, (route) => false),
          child: Text(AppStrings.continueShopping),
        ),
      ),
    );
  }
}
