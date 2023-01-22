import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_colors.dart';
import '../blocs/cart/cart_cubit.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.checkOut),
      ),
      bottomSheet: Container(
        height: 230.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  AppStrings.order,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.greyDark),
                ),
                const Spacer(),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      '${state.cart.totalAmount.toInt()}\$',
                      style: Theme.of(context).textTheme.headlineSmall,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  AppStrings.order,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.greyDark),
                ),
                const Spacer(),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      '${state.cart.totalAmount.toInt()}\$',
                      style: Theme.of(context).textTheme.headlineSmall,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  AppStrings.order,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.greyDark),
                ),
                const Spacer(),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      '${state.cart.totalAmount.toInt()}\$',
                      style: Theme.of(context).textTheme.headlineSmall,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(
              child: Text(AppStrings.submitOrder),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
