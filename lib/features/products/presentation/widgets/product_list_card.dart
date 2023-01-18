// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_gifs/loading_gifs.dart';

import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/rate_widget.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({
    Key? key,
    required this.product,
    required this.icon,
  }) : super(key: key);

  final Product product;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    Widget priceText = Html(
      data: product.priceHtml.replaceAll("</del> <ins>", "</del> &nbsp; <ins>"),
      style: {
        'del': Style(
          color: AppColors.lightBlack,
          textDecorationColor: AppColors.lightBlack,
          textDecorationThickness: 2,
        ),
        'span': Style(
          color: Theme.of(context).brightness == Brightness.dark
              ? (product.isOnSale ? AppColors.saleDark : AppColors.whiteDark)
              : AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        'ins': Style(
          textDecoration: TextDecoration.none,
        ),
      },
    );

    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProductsCubit>(context).getProduct(product.id);
        Navigator.pushNamed(context, AppRoutes.productDetails,
            arguments: product.id);
      },
      child: SizedBox(
        height: 120.h,
        child: Stack(
          children: [
            Container(
              height: 105.h,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.dark
                    : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: AppColors.shadowColor,
                    blurRadius: 25,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      child: FadeInImage.assetNetwork(
                        placeholder: cupertinoActivityIndicatorSmall,
                        image: product.img,
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.scaleDown,
                        height: 105.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(1.w),
                          child: Text(
                            product.name,
                            style: Theme.of(context).textTheme.titleLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Text(
                            product.category,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        RateWidget(
                          rate: product.rate.toInt(),
                        ),
                        SizedBox(height: 2.h),
                        priceText
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: icon,
            ),
            Positioned(
              top: 8.h,
              left: 8.w,
              child: Row(
                children: [
                  if (product.isNew)
                    Container(
                      height: 24.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: AppColors.lightBlack,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'NEW',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  if (product.isOnSale && product.isNew) SizedBox(width: 4.w),
                  if (product.isOnSale)
                    Container(
                      height: 24.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          '-${product.saleDisc}',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
