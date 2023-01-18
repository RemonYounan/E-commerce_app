import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/loading_widget.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    Key? key,
    required PagingController<int, Product> pagingController,
  })  : _pagingController = pagingController,
        super(key: key);

  final PagingController<int, Product> _pagingController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () => Future.sync(() => _pagingController.refresh()),
      child: PagedGridView(
        key: const PageStorageKey('ProductsGridView'),
        pagingController: _pagingController,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
        builderDelegate: PagedChildBuilderDelegate<Product>(
          itemBuilder: (context, item, _) => ProductGridCard(
            product: item,
            icon: FavoriteButton(id: item.id),
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
    );
  }
}
