import 'package:ecommerce_app/features/products/presentation/blocs/products_bloc/products_bloc.dart';

import '../../../../core/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/enums.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';

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

  final _pageSize = 5;

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      _fetch(pageKey);
    });
  }

  Future<void> _fetch(int pageKey) async {
    try {
      final sortBy = Provider.of<GlobalProvider>(context, listen: false).sortBy;
      BlocProvider.of<ProductsBloc>(context).add(GetCategoryProductsEvent(
          id: widget.category.id, offset: pageKey, orderBy: sortBy));
      final newProducts = BlocProvider.of<ProductsBloc>(context).catProducts;
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
    super.dispose();
    pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: FilterSection(
                category: widget.category, pagingController: pagingController),
          ),
          Expanded(
            child:
                Provider.of<GlobalProvider>(context).listStyle == ListStyle.grid
                    ? ProductsGridView(pagingController: pagingController)
                    : ProductsListView(pagingController: pagingController),
          ),
        ],
      ),
    );
  }
}
