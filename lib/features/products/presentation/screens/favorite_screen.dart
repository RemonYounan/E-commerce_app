import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/providers/global_provider.dart';
import '../../domain/entities/product.dart';
import '../blocs/products_cubit/products_cubit.dart';
import '../widgets/add_to_bag_button.dart';
import '../widgets/product_grid_card.dart';
import '../widgets/product_list_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: const PageStorageKey('FavoritsScreen'),
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 140.h,
              collapsedHeight: 110.h,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                titlePadding: EdgeInsets.only(left: 14.w),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.favorites,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.filter_list,
                          size: 24,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          AppStrings.filters,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const Spacer(),
                        IconButton(
                          splashRadius: 18,
                          onPressed: () {
                            Provider.of<GlobalProvider>(context, listen: false)
                                .changeListStyle();
                          },
                          icon:
                              Provider.of<GlobalProvider>(context).listStyle ==
                                      ListStyle.grid
                                  ? const Icon(Icons.list_rounded)
                                  : const Icon(Icons.grid_view_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            SliverList(
              key: const PageStorageKey('FavoritsList'),
              delegate: SliverChildListDelegate.fixed(
                [
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoadedState) {
                        final List<Product> featuresProducts =
                            state.featuresProducts;
                        return Provider.of<GlobalProvider>(context).listStyle ==
                                ListStyle.list
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                key: const PageStorageKey(
                                    'FeaturesProductsList'),
                                itemCount: featuresProducts.length,
                                itemBuilder: (context, index) {
                                  return ProductListCard(
                                    product: featuresProducts[index],
                                    icon: AddToBagButton(
                                      product: featuresProducts[index],
                                    ),
                                  );
                                },
                              )
                            : GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 10.h),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15.w,
                                  mainAxisExtent: 300.h,
                                ),
                                key: const PageStorageKey(
                                    'FeaturesProductsList'),
                                itemCount: featuresProducts.length,
                                itemBuilder: (context, index) {
                                  return ProductGridCard(
                                    product: featuresProducts[index],
                                    icon: AddToBagButton(
                                        product: featuresProducts[index]),
                                  );
                                },
                              );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}