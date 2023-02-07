import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../domain/entities/product.dart';
import '../favorite_button.dart';
import '../../../../../core/utils/loading_widget.dart';
import '../no_more_items_widget.dart';
import '../product_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
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
        child: PagedListView(
          key: const PageStorageKey('ProductsListView'),
          scrollController: scrollController,
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<Product>(
              itemBuilder: (context, item, i) =>
                  AnimationConfiguration.staggeredList(
                    position: i,
                    duration: const Duration(milliseconds: 375),
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        duration: const Duration(milliseconds: 150),
                        child: ProductListCard(
                          product: item,
                          icon: FavoriteButton(id: item.id),
                        ),
                      ),
                    ),
                  ),
              noMoreItemsIndicatorBuilder: (context) =>
                  SizedBox(height: 40.h, child: const NoMoreItemsWidget()),
              newPageProgressIndicatorBuilder: (_) => const LoadingWidget(),
              firstPageProgressIndicatorBuilder: (_) => const LoadingWidget()),
        ),
      ),
    );
  }
}
