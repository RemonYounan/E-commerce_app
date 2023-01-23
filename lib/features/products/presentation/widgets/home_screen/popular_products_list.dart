import 'package:ecommerce_app/core/utils/error_message_wiget.dart';

import '../../../domain/entities/product.dart';
import '../../blocs/products_cubit/products_cubit.dart';
import '../favorite_button.dart';
import '../product_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularProductsList extends StatelessWidget {
  const PopularProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.status == ProductsStatus.loading) {
          return const SizedBox.shrink();
        } else if (state.status == ProductsStatus.error) {
          return const ErrorMessageWiget();
        } else {
          final List<Product> popularProducts = state.popularProducts;
          return SizedBox(
            height: 280.h,
            child: ListView.builder(
              key: const PageStorageKey('PopularProductsList'),
              scrollDirection: Axis.horizontal,
              itemCount: popularProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ProductGridCard(
                    product: popularProducts[index],
                    icon: FavoriteButton(id: popularProducts[index].id),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
