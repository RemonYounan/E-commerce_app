import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/products_cubit/products_cubit.dart';
import '../widgets/home_screen/banner_widget.dart';
import '../widgets/home_screen/features_products_list.dart';
import '../widgets/home_screen/newest_products_list.dart';
import '../widgets/home_screen/popular_products_list.dart';
import '../widgets/home_screen/products_section.dart';
import '../../../../core/utils/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state.status == ProductsStatus.loading) {
              return const LoadingWidget();
            } else if (state.status == ProductsStatus.error) {
              return const ErrorMessageWiget();
            } else {
              return SingleChildScrollView(
                child: AnimationLimiter(
                  child: Column(
                    key: const PageStorageKey('HomeScreenController'),
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 400),
                      childAnimationBuilder: (child) => SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: child,
                          )),
                      children: [
                        const BannerWidget(),
                        SizedBox(height: 30.h),
                        ProductsSection(
                          title: AppStrings.featuresProducts,
                          child: const FeaturesProductsList(),
                        ),
                        SizedBox(height: 30.h),
                        ProductsSection(
                          title: AppStrings.popularProducts,
                          child: const PopularProductsList(),
                        ),
                        SizedBox(height: 30.h),
                        ProductsSection(
                          title: AppStrings.newestProducts,
                          child: const NewestProductsList(),
                        ),
                        SizedBox(height: 80.h),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
