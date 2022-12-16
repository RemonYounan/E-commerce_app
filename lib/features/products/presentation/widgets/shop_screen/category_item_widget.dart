import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';

import 'package:ecommerce_app/features/products/domain/entities/category.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_gifs/loading_gifs.dart';

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
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.catProducts,
              arguments: category);
        },
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
                child: FadeInImage.assetNetwork(
                  placeholder: cupertinoActivityIndicatorSmall,
                  image: category.img,
                  fit: BoxFit.cover,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
