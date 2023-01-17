import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/home_screen/banner_widget.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/home_screen/features_products_list.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/home_screen/newest_products_list.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/home_screen/popular_products_list.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/home_screen/products_section.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadedState) {
              return ListView(
                key: const PageStorageKey('HomeScreenController'),
                children: [
                  const BannerWidget(),
                  SizedBox(height: 32.h),
                  ProductsSection(
                    title: AppStrings.featuresProducts,
                    child: const FeaturesProductsList(),
                  ),
                  SizedBox(height: 32.h),
                  ProductsSection(
                    title: AppStrings.popularProducts,
                    child: const PopularProductsList(),
                  ),
                  SizedBox(height: 32.h),
                  ProductsSection(
                    title: AppStrings.newestProducts,
                    child: const NewestProductsList(),
                  ),
                  SizedBox(height: 250.h),
                ],
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
