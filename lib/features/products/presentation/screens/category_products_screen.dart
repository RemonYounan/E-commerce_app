import 'package:ecommerce_app/core/utils/custom_search_delegate.dart';
import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';

import '../../../../core/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/enums.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../blocs/products_cubit/products_cubit.dart';

import '../widgets/shop_screen/filter_section.dart';
import '../widgets/shop_screen/products_grid_view.dart';
import '../widgets/shop_screen/products_list_view.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 0);

  late ScrollController _scrollController;

  final _pageSize = 5;
  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      _fetch(pageKey);
    });
    _scrollController = ScrollController();
  }

  Future<void> _fetch(int pageKey) async {
    try {
      final sortBy = Provider.of<GlobalProvider>(context, listen: false).sortBy;
      final newProducts = await BlocProvider.of<ProductsCubit>(context)
          .getCategoryProducts(widget.category.id, pageKey, sortBy);
      final isLastPage = newProducts.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newProducts);
      } else {
        final nextPageKey = pageKey + newProducts.length;
        pagingController.appendPage(newProducts, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: FilterSection(
              category: widget.category,
              pagingController: pagingController,
              scrollController: _scrollController,
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state.status == ProductsStatus.loading) {
                  return const LoadingWidget();
                } else if (state.status == ProductsStatus.error) {
                  return const ErrorMessageWiget();
                } else {
                  return Provider.of<GlobalProvider>(context).listStyle ==
                          ListStyle.list
                      ? ProductsListView(
                          scrollController: _scrollController,
                          pagingController: pagingController)
                      : ProductsGridView(
                          scrollController: _scrollController,
                          pagingController: pagingController);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
