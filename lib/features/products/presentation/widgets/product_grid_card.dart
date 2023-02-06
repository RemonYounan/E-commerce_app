import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/utils/placeholder_loading_widget.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_details_screen.dart';

import '../../../../core/common/app_colors.dart';
import '../../domain/entities/product.dart';
import '../blocs/products_cubit/products_cubit.dart';
import 'rate_widget.dart';

class ProductGridCard extends StatelessWidget {
  const ProductGridCard({
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
          textDecorationThickness: 3,
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

    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      openBuilder: (context, action) {
        BlocProvider.of<ProductsCubit>(context).getProduct(product.id);
        return ProductDetailsScreen(
          id: product.id,
          product: product,
        );
      },
      closedBuilder: (context, openContainer) {
        return InkWell(
          onTap: openContainer,
          child: SizedBox(
            height: 280.h,
            width: 160.w,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: product.img,
                        height: 170.h,
                        width: 162.w,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const PlaceholderLoadingWidget(),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    RateWidget(rate: product.rate.toInt()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Text(
                        product.category,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    priceText
                  ],
                ),
                // on sale icon
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
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      if (product.isOnSale && product.isNew)
                        SizedBox(width: 4.w),
                      if (product.isOnSale)
                        Container(
                          height: 24.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.saleDark
                                  : AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              '-${product.saleDisc}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  top: 150.h,
                  right: 1,
                  child: icon,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
