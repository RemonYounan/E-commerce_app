import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/utils/placeholder_loading_widget.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_text_styles.dart';

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

    return OpenContainer(
      openElevation: 0,
      closedElevation: 0,
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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: InkWell(
            onTap: openContainer,
            child: SizedBox(
              height: 120.h,
              child: Stack(
                children: [
                  Container(
                    height: 115.h,
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
                        SizedBox(
                          width: 115.w,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                              child: CachedNetworkImage(
                                imageUrl: product.img,
                                height: 115.h,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const PlaceholderLoadingWidget(),
                              )),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(1.w),
                                child: Text(
                                  product.name,
                                  style: AppTextStyle.subheadTextStyle(context),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Text(
                                  product.category,
                                  style: AppTextStyle.helperTextStyle2(context),
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
                                style: AppTextStyle.helperTextStyle2(context)
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
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                '-${product.saleDisc}',
                                style: AppTextStyle.helperTextStyle2(context)
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
