import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/placeholder_loading_widget.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/toast.dart';
import '../../../products/presentation/blocs/products_cubit/products_cubit.dart';
import '../../domain/entities/cart_product.dart';
import '../blocs/cart/cart_cubit.dart';
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
      child: OpenContainer(
        closedColor: Colors.transparent,
        openColor: Colors.transparent,
        closedElevation: 0,
        openElevation: 0,
        openBuilder: (context, action) {
          BlocProvider.of<ProductsCubit>(context).getProduct(cartProduct.id);
          return ProductDetailsScreen(
            id: cartProduct.id,
            cartProduct: cartProduct,
          );
        },
        closedBuilder: (context, action) => InkWell(
          onTap: action,
          child: SizedBox(
            height: 120.h,
            child: Stack(
              children: [
                Container(
                  height: 120.h,
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
                            child: CachedNetworkImage(
                              imageUrl: cartProduct.img,
                              height: 120.h,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const PlaceholderLoadingWidget(),
                            )),
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
                                      style: AppTextStyle.subheadTextStyle(
                                          context),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.w),
                                      child: Text(
                                        cartProduct.category,
                                        style: AppTextStyle.helperTextStyle2(
                                            context),
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
                                          style: AppTextStyle
                                              .titleNormalTextStyle2(context),
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
                                    padding: EdgeInsets.zero,
                                    splashRadius: 5,
                                    tooltip: AppStrings.more,
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
                                          style: AppTextStyle.helperTextStyle1(
                                              context),
                                        ),
                                        onTap: () {},
                                      ),
                                      PopupMenuItem(
                                        child: Text(
                                          AppStrings.deleteFromList,
                                          style: AppTextStyle.helperTextStyle1(
                                              context),
                                        ),
                                        onTap: () {
                                          BlocProvider.of<CartCubit>(context)
                                              .removeFromCart(cartProduct.id);
                                          fToast.init(context);
                                          showToast(
                                            context: context,
                                            title: AppStrings.removedFromCart,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${cartProduct.price.toInt()}\$',
                                    style:
                                        AppTextStyle.subheadTextStyle(context),
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
                                style: AppTextStyle.helperTextStyle1(context)),
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
                              style: AppTextStyle.helperTextStyle1(context),
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
      ),
    );
  }
}
