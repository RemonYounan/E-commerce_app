import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/order/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/custom_button.dart';

class CheckOutSummaryWidget extends StatelessWidget {
  const CheckOutSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final totalAmount = state.cart.totalAmount.toInt();
        return Container(
          height: 240.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.order,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isDark ? AppColors.greyDark : AppColors.grey),
                  ),
                  Text(
                    '$totalAmount\$',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  if (state.status == OrderStatus.loading) {
                    return LoadingWidget(size: 20.r);
                  } else {
                    final cost = state.shippingCost!.cost.toInt();
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.delivery,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: isDark
                                          ? AppColors.greyDark
                                          : AppColors.grey),
                            ),
                            Text(
                              '$cost\$',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.summary,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: isDark
                                          ? AppColors.greyDark
                                          : AppColors.grey),
                            ),
                            Text(
                              '${totalAmount + cost}\$',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 20.h),
              CustomButton(
                child: Text(AppStrings.submitOrder),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
