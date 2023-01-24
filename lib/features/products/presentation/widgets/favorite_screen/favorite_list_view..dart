import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../domain/entities/product.dart';
import '../add_to_bag_button.dart';
import '../product_list_card.dart';

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({
    Key? key,
    required this.favProducts,
  }) : super(key: key);

  final List<Product> favProducts;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        key: const PageStorageKey(
          'FeaturesProductsList',
        ),
        itemCount: favProducts.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              horizontalOffset: 70.0,
              duration: const Duration(milliseconds: 400),
              child: FadeInAnimation(
                child: ProductListCard(
                  product: favProducts[index],
                  icon: AddToBagButton(
                    product: favProducts[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
