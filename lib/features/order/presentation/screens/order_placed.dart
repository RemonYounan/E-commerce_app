import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              AppStrings.orderSuccess,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              AppStrings.thankYou,
              style: Theme.of(context).textTheme.labelLarge,
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
