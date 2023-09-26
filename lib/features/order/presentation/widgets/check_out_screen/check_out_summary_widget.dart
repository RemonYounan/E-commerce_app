import 'package:ecommerce_app/features/order/presentation/blocs/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/order/order_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/check_out_screen/order_price_widget.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/check_out_screen/submit_order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';

class CheckOutSummaryWidget extends StatelessWidget {
  const CheckOutSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          final totalAmount = state.cart.totalAmount.toInt();
          return Container(
            height: 240.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 20.h),
                OrderPriceWidget(title: AppStrings.order, value: totalAmount),
                SizedBox(height: 20.h),
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    final cost = BlocProvider.of<OrderCubit>(context)
                        .shippingCost
                        .cost
                        .toInt();
                    return Column(
                      children: [
                        OrderPriceWidget(
                            title: AppStrings.delivery, value: cost),
                        SizedBox(height: 20.h),
                        OrderPriceWidget(
                          title: AppStrings.summary,
                          value: totalAmount + cost,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: isDark
                                      ? AppColors.greyDark
                                      : AppColors.grey),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20.h),
                const SubmitOrderButton(),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
