import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../domain/entities/product.dart';
import '../add_to_bag_button.dart';
import '../product_grid_card.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({
    Key? key,
    required this.favProducts,
  }) : super(key: key);

  final List<Product> favProducts;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisExtent: 300.h,
        ),
        key: const PageStorageKey('FeaturesProductsList'),
        itemCount: favProducts.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: favProducts.length,
            duration: const Duration(milliseconds: 375),
            child: ScaleAnimation(
              duration: const Duration(milliseconds: 400),
              child: FadeInAnimation(
                child: ProductGridCard(
                  product: favProducts[index],
                  icon: AddToBagButton(product: favProducts[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
