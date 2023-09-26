import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/placeholder_loading_widget.dart';
import 'package:ecommerce_app/features/products/presentation/screens/category_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../domain/entities/category.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        openColor: Colors.transparent,
        closedColor: Colors.transparent,
        openBuilder: (context, action) =>
            CategoryProductsScreen(category: category),
        closedBuilder: (context, action) => InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: action,
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.dark
                  : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 25,
                  color: AppColors.shadowColor,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 23.w),
                    child: Text(
                      category.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: category.img,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      placeholder: (context, url) =>
                          const PlaceholderLoadingWidget(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
