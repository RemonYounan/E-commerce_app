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
  }) : super(key: key);

  final PagingController<int, Product> pagingController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () => Future.sync(() => pagingController.refresh()),
      child: PagedListView(
        key: const PageStorageKey('ProductsListView'),
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, item, _) => ProductListCard(
                  product: item,
                  icon: FavoriteButton(id: item.id),
                ),
            noMoreItemsIndicatorBuilder: (context) =>
                SizedBox(height: 40.h, child: const NoMoreItemsWidget()),
            newPageProgressIndicatorBuilder: (_) => const LoadingWidget(),
            firstPageProgressIndicatorBuilder: (_) => const LoadingWidget()),
      ),
    );
  }
}
