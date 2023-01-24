import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_screen/favorite_grid_view.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_screen/favorite_list_view..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class FavoriteScreenList extends StatelessWidget {
  const FavoriteScreenList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      key: const PageStorageKey('FavoritsList'),
      delegate: SliverChildListDelegate(
        [
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state.status == ProductsStatus.loading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const LoadingWidget(),
                );
              } else if (state.status == ProductsStatus.error) {
                return const ErrorMessageWiget();
              } else {
                final List<Product> favProducts = state.favProducts;
                final isList = Provider.of<GlobalProvider>(context).listStyle ==
                    ListStyle.list;
                return isList
                    ? FavoriteListView(favProducts: favProducts)
                    : FavoriteGridView(favProducts: favProducts);
              }
            },
          ),
        ],
      ),
    );
  }
}
