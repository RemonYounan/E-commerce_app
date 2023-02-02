import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_gifs/loading_gifs.dart';

import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/core/utils/extensions.dart';
import 'package:ecommerce_app/features/order/domain/entities/order.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../blocs/order/order_cubit.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    late Color color;
    switch (order.status) {
      case OrderStatus.completed:
        color = isDark ? AppColors.greenDark : AppColors.green;
        break;
      case OrderStatus.pending:
        color = isDark ? AppColors.whiteDark : AppColors.black;
        break;
      case OrderStatus.cancelled:
        color = isDark ? AppColors.errorColorDark : AppColors.errorColor;
        break;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: SizedBox(
        height: 130.h,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(10)),
                  child: FadeInImage.assetNetwork(
                    placeholder: cupertinoActivityIndicatorSmall,
                    placeholderFit: BoxFit.scaleDown,
                    fit: BoxFit.cover,
                    image: order.img,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      '${AppStrings.orderNo} ${order.id}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      order.dateCreated,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: isDark ? AppColors.greyDark : AppColors.grey),
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.status.name.capitalize(),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: color,
                                  ),
                        ),
                        SizedBox(
                          height: 35.h,
                          width: 100.w,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(
                                context, AppRoutes.orderDetails,
                                arguments: order.id),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isDark ? AppColors.dark : AppColors.white,
                              surfaceTintColor: Colors.transparent,
                              side: BorderSide(
                                color: isDark
                                    ? AppColors.white
                                    : AppColors.lightBlack,
                              ),
                              foregroundColor: AppColors.white,
                            ),
                            child: Text(
                              AppStrings.details,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
