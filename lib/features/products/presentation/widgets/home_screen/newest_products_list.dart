import '../../blocs/products_cubit/products_cubit.dart';
import '../favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/product.dart';
import '../product_grid_card.dart';

class NewestProductsList extends StatelessWidget {
  const NewestProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadedState) {
          final List<Product> newestProducts = state.newestProducts;
          return SizedBox(
            height: 280.h,
            child: ListView.builder(
              key: const PageStorageKey('NewestProductsList'),
              scrollDirection: Axis.horizontal,
              itemCount: newestProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ProductGridCard(
                    product: newestProducts[index],
                    icon: FavoriteButton(id: newestProducts[index].id),
                  ),
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
