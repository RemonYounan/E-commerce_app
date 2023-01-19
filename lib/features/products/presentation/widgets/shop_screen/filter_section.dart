import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/enums.dart';
import '../../../domain/entities/category.dart';
import '../../../../../core/providers/global_provider.dart';
import '../../../domain/entities/product.dart';
import 'sort_by_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    Key? key,
    required this.category,
    required this.pagingController,
  }) : super(key: key);

  final Category category;
  final PagingController<int, Product> pagingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.filter_list),
        SizedBox(width: 5.w),
        Text(AppStrings.filters),
        SizedBox(width: 45.w),
        Expanded(
          child: SortByMenuWidget(
            pagingController: pagingController,
          ),
        ),
        IconButton(
          splashRadius: 18,
          onPressed: () {
            Provider.of<GlobalProvider>(context, listen: false)
                .changeListStyle();
          },
          icon: Provider.of<GlobalProvider>(context).listStyle == ListStyle.grid
              ? const Icon(Icons.list_rounded)
              : const Icon(Icons.grid_view_rounded),
        ),
      ],
    );
  }
}
