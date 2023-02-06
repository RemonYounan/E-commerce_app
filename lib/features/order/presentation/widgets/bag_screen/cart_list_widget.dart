import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/bag_screen/bag_empty_widget.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/product_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../blocs/cart/cart_cubit.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          final cartProducts = state.cart.products;
          return Column(
            children: [
              AnimationLimiter(
                child: ListView.builder(
                  key: const PageStorageKey('FeaturesProductsList'),
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shrinkWrap: true,
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: ProductCartCard(
                            cartProduct: cartProducts[index],
                            count: cartProducts[index].count,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 190.h),
            ],
          );
        } else if (state is CartLoadingState) {
          return const LoadingWidget();
        } else if (state is CartEmptyState) {
          return const EmptyBagWidget();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
