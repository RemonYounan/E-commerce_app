import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedProductsSection extends StatelessWidget {
  const RelatedProductsSection({
    Key? key,
    required this.related,
  }) : super(key: key);

  final List<Product> related;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'you_can_like'.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              '${related.length} items',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: related.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ProductGridCard(product: related[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
