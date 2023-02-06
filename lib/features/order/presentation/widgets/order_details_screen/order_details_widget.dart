import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/utils/extensions.dart';
import 'package:ecommerce_app/core/utils/placeholder_loading_widget.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/order_details_screen/order_info_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_gifs/loading_gifs.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/enums.dart';
import '../../../domain/entities/order_details.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
  });

  final OrderDetails order;

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
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${AppStrings.orderNo} ${order.id}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              DateFormat.yMd().format(order.dateCreated),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: isDark ? AppColors.greyDark : AppColors.grey),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${order.products.length} ${AppStrings.items}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              order.status.name.capitalize(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: order.products.length,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          itemBuilder: (context, index) {
            final product = order.products[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: SizedBox(
                height: 110.h,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl: product.img,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const PlaceholderLoadingWidget(),
                            )
                            
                            ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              product.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              children: [
                                Text(
                                  '${AppStrings.units} ${product.count}',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const Spacer(),
                                Text(
                                  '${product.total.toInt()}\$',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(width: 10.w),
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
          },
        ),
        Text(
          'Order information',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 10.h),
        OrderInfoItemWidget(
          title: 'Shipping Address:',
          value:
              '${order.address.address1}, ${order.address.city}, ${order.address.country} ${order.address.postcode}, ${order.address.state}',
        ),
        OrderInfoItemWidget(
          title: AppStrings.paymentMethod,
          value: order.paymentMethod == 'cod'
              ? AppStrings.cashOnDelivery
              : order.paymentMethod,
        ),
        OrderInfoItemWidget(
          title: AppStrings.discount,
          value: '${order.discountTotal.toInt()}%',
        ),
        OrderInfoItemWidget(
          title: AppStrings.shippingCost,
          value: '${order.shippingTotal.toInt()}\$',
        ),
        OrderInfoItemWidget(
          title: AppStrings.totalAmount,
          value: '${order.allTotal.toInt()}\$',
        ),
      ],
    );
  }
}
