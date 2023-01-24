import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/utils/loading_widget.dart';
import '../../../domain/entities/product.dart';
import '../favorite_button.dart';
import '../product_grid_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    Key? key,
    required this.pagingController,
    required this.scrollController,
  }) : super(key: key);

  final PagingController<int, Product> pagingController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () => Future.sync(() => pagingController.refresh()),
      child: AnimationLimiter(
        child: PagedGridView(
          key: const PageStorageKey('ProductsGridView'),
          pagingController: pagingController,
          scrollController: scrollController,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
          builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, item, i) =>
                AnimationConfiguration.staggeredGrid(
              position: i,
              duration: const Duration(milliseconds: 375),
              columnCount: pagingController.itemList!.length,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 400),
                child: FadeInAnimation(
                  child: ProductGridCard(
                    product: item,
                    icon: FavoriteButton(id: item.id),
                  ),
                ),
              ),
            ),
            newPageProgressIndicatorBuilder: (_) => const LoadingWidget(),
            firstPageProgressIndicatorBuilder: (_) => const LoadingWidget(),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 280.h,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
          ),
        ),
      ),
    );
  }
}
