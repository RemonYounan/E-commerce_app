import 'package:ecommerce_app/features/order/presentation/widgets/product_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../blocs/cart/cart_cubit.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartProducts = state.cart.products ?? [];
        if (cartProducts.isEmpty) {
          return SizedBox(
            height: 300.h,
            child: Center(
              child: Text(
                AppStrings.bagEmpty,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          );
        }
        return Column(
          children: [
            AnimationLimiter(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 15.h),
                shrinkWrap: true,
                key: const PageStorageKey('FeaturesProductsList'),
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
      },
    );
  }
}
