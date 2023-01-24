import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../core/common/app_colors.dart';

import '../../blocs/products_cubit/products_cubit.dart';
import '../../../../../core/utils/loading_widget.dart';
import 'category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.status == ProductsStatus.loading) {
          return const LoadingWidget();
        } else if (state.status == ProductsStatus.error) {
          return const ErrorMessageWiget();
        } else {
          return SingleChildScrollView(
            child: AnimationLimiter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (child) => SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: child,
                      ),
                    ),
                    children: [
                      Container(
                        height: 100.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.saleDark
                              : AppColors.sale,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 25,
                              color: AppColors.shadowColor,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SUMMER SALES',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: AppColors.white,
                                  ),
                            ),
                            Text(
                              'Up to 50% off',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.categories.length,
                        itemBuilder: (ctx, index) => CategoryItemWidget(
                            category: state.categories[index]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
