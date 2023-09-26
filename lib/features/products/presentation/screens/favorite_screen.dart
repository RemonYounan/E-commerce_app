import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/products/presentation/widgets/favorite_screen/favorite_screen_appbar.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_screen/favorite_screen_list.dart';

import '../blocs/products_cubit/products_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await BlocProvider.of<ProductsCubit>(context).refreshFavProducts();
          },
          color: AppColors.primaryColor,
          child: CustomScrollView(
            key: const PageStorageKey('FavoritsScreen'),
            controller: _scrollController,
            slivers: [
              FavoriteScreenAppBar(scrollController: _scrollController),
              const FavoriteScreenList(),
            ],
          ),
        ),
      ),
    );
  }
}
