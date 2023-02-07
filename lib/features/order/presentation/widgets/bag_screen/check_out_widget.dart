import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:ecommerce_app/features/order/presentation/widgets/bag_screen/promo_code_widget.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/bag_screen/total_amount_widget.dart';

import 'check_out_button.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: SlideAnimation(
        horizontalOffset: 50.0,
        delay: const Duration(milliseconds: 50),
        child: FadeInAnimation(
          child: Container(
              height: 200.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const PromoCodeWidget(),
                  SizedBox(height: 20.h),
                  const TotalAmountWidget(),
                  SizedBox(height: 20.h),
                  const CheckOutButton(),
                ],
              )),
        ),
      ),
    );
  }
}
