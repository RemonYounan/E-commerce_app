import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:ecommerce_app/features/products/domain/entities/category.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SortByMenuWidget extends StatelessWidget {
  const SortByMenuWidget({
    required this.pagingController,
    Key? key,
  }) : super(key: key);

  final PagingController<int, Product> pagingController;

  void sortProducts(String value) {}
  @override
  Widget build(BuildContext context) {
    final List<SortByItem> items = [
      SortByItem(
        name: AppStrings.newest,
        value: AppConstants.newToOld,
      ),
      SortByItem(
        name: AppStrings.priceLowToHigh,
        value: AppConstants.priceLowToHigh,
      ),
      SortByItem(
        name: AppStrings.priceHighToLow,
        value: AppConstants.priceHighToLow,
      ),
    ];

    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: SizedBox(
                height: 300.h,
                child: Column(
                  children: [
                    Text(
                      AppStrings.sortBy,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 15.h),
                    ...List.generate(
                      items.length,
                      (index) => RadioListTile(
                        value: items[index].value,
                        title: Text(
                          items[index].name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        groupValue: Provider.of<GlobalProvider>(context).sortBy,
                        onChanged: (value) {
                          Provider.of<GlobalProvider>(context, listen: false)
                              .changeSortBy(value!);
                          Navigator.pop(context);
                          pagingController.refresh();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          const Icon(Icons.filter_list),
          SizedBox(width: 5.w),
          Text(
            Provider.of<GlobalProvider>(context).title,
          ),
        ],
      ),
    );
  }
}

class SortByItem {
  final String name;
  final String value;

  const SortByItem({
    required this.name,
    required this.value,
  });
}
