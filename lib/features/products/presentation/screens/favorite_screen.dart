import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_screen/favorite_screen_appbar.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_screen/favorite_screen_list.dart';

import '../blocs/products_cubit/products_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final id = BlocProvider.of<AuthCubit>(context).user.id;
            await BlocProvider.of<ProductsCubit>(context)
                .refreshFavProducts(id);
          },
          child: const CustomScrollView(
            key: PageStorageKey('FavoritsScreen'),
            slivers: [
              FavoriteScreenAppBar(),
              FavoriteScreenList(),
            ],
          ),
        ),
      ),
    );
  }
}
