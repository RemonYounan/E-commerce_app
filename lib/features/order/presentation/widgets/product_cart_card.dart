import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_gifs/loading_gifs.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/app_routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/toast.dart';
import '../../domain/entities/cart_product.dart';
import '../blocs/cart/cart_cubit.dart';
import '../../../products/presentation/blocs/products_cubit/products_cubit.dart';

import 'bag_screen/add_or_remove_button.dart';

class ProductCartCard extends StatelessWidget {
  const ProductCartCard({
    Key? key,
    required this.cartProduct,
    required this.count,
  }) : super(key: key);

  final CartProduct cartProduct;
  final int count;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<ProductsCubit>(context).getProduct(cartProduct.id);
          Navigator.pushNamed(context, AppRoutes.productDetails, arguments: {
            'id': cartProduct.id,
            'cartProduct': cartProduct,
          });
        },
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
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                          placeholder: cupertinoActivityIndicatorSmall,
                          image: cartProduct.img,
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.scaleDown,
                          height: 115.h,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartProduct.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Text(
                                      cartProduct.category,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      AddOrRemoveButton(
                                        icon: Icons.remove,
                                        onTap: () {
                                          BlocProvider.of<CartCubit>(context)
                                              .decreaseProductQuantity(
                                                  cartProduct.id);
                                        },
                                      ),
                                      SizedBox(width: 16.w),
                                      Text(
                                        count.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      SizedBox(width: 16.w),
                                      AddOrRemoveButton(
                                        icon: Icons.add,
                                        onTap: () {
                                          BlocProvider.of<CartCubit>(context)
                                              .increaseProductQuantity(
                                                  cartProduct.id);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                PopupMenuButton(
                                  color: isDark
                                      ? AppColors.dark
                                      : AppColors.backgroundColor,
                                  elevation: 10,
                                  padding: EdgeInsets.zero,
                                  splashRadius: 5,
                                  tooltip: AppStrings.more,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.more_vert_rounded,
                                    color: isDark
                                        ? AppColors.greyDark
                                        : AppColors.grey,
                                  ),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text(
                                        AppStrings.addToFavorites,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: isDark
                                                    ? AppColors.white
                                                    : AppColors.black),
                                      ),
                                      onTap: () {},
                                    ),
                                    PopupMenuItem(
                                      child: Text(
                                        AppStrings.deleteFromList,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: isDark
                                                    ? AppColors.white
                                                    : AppColors.black),
                                      ),
                                      onTap: () {
                                        BlocProvider.of<CartCubit>(context)
                                            .removeFromCart(cartProduct.id);
                                        fToast.init(context);
                                        showToast(AppStrings.removedFromCart,
                                            AppColors.black);
                                      },
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  '${cartProduct.price.toInt()}\$',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Row(
                  children: [
                    if (cartProduct.isNew)
                      Container(
                        height: 24.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: AppColors.lightBlack,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text('NEW',
                              style: Theme.of(context).textTheme.labelMedium),
                        ),
                      ),
                    if (cartProduct.isOnSale && cartProduct.isNew)
                      SizedBox(width: 4.w),
                    if (cartProduct.isOnSale)
                      Container(
                        height: 24.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            '-${cartProduct.saleDisc}',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: AppColors.white),
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
  }
}
