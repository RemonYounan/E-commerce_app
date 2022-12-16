import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_grid_card.dart';

class FeaturesProductsList extends StatelessWidget {
  const FeaturesProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadedState) {
          final List<Product> featuresProducts = state.featuresProducts;
          return SizedBox(
            height: 280.h,
            child: ListView.builder(
              key: const PageStorageKey('FeaturesProductsList'),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: featuresProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ProductGridCard(product: featuresProducts[index]),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
