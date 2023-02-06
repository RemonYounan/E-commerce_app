import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/utils/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../domain/entities/order.dart';
import '../../blocs/order/order_cubit.dart';
import 'order_item_widget.dart';

import '../../../../auth/presentation/blocs/auth/auth_cubit.dart';

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({
    Key? key,
    required this.orders,
  }) : super(key: key);

  final List<OrderItem> orders;
  Future<void> onRefresh(BuildContext context) async {
    final id = BlocProvider.of<AuthCubit>(context).user.id;
    BlocProvider.of<OrderCubit>(context).refreshOrders(id);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(context),
      color: AppColors.primaryColor,
      child: orders.isNotEmpty
          ? AnimationLimiter(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
                itemCount: orders.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: FlipAnimation(
                    child: FadeInAnimation(
                      child: OrderItemWidget(
                        order: orders[index],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : EmptyStateWidget(
              imgPath: AppAssets.emptyBag,
              title: AppStrings.noOrdersTitle,
              discription: AppStrings.noOrdersDisc,
            ),
    );
  }
}
