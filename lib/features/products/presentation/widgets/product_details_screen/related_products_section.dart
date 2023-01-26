import '../../../../../core/constants/app_strings.dart';
import '../../../domain/entities/product_details.dart';
import '../favorite_button.dart';
import '../product_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedProductsSection extends StatelessWidget {
  const RelatedProductsSection({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.youCanLike,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              '${product.related.length} ${AppStrings.items}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 290.h,
          child: ListView.builder(
            key: PageStorageKey('ProductDetailsRelated:$product.id'),
            scrollDirection: Axis.horizontal,
            itemCount: product.related.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ProductGridCard(
                  product: product.related[index],
                  icon: FavoriteButton(id: product.related[index].id),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
