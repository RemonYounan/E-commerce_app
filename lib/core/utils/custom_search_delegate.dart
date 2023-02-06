import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/empty_state_widget.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/core/utils/show_error_toast.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: AppColors.errorColorDark,
          ),
        ),
        fillColor:
            isDark ? AppColors.backgroundColorDark : AppColors.backgroundColor,
        filled: true,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
              BlocProvider.of<ProductsCubit>(context).clearSearchProducts();
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SearchResultsList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 3) {
      BlocProvider.of<ProductsCubit>(context).getSearchProducts(query);
      return const SearchResultsList();
    } else {
      return const SizedBox.shrink();
    }
  }
}

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state.status == ProductsStatus.error) {
          showErrorToast(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state.status == ProductsStatus.loading) {
          return const LoadingWidget();
        } else if (state.status == ProductsStatus.loaded) {
          final products = state.searchProducts;
          return products.isNotEmpty
              ? ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductListCard(
                      product: product,
                      icon: FavoriteButton(
                        id: product.id,
                      ),
                    );
                  },
                )
              : EmptyStateWidget(
                  imgPath: AppAssets.noResults,
                  title: AppStrings.noResultTitle,
                  discription: AppStrings.noResultDisc,
                );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
