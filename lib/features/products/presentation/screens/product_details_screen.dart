import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app_routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/providers/global_provider.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../order/domain/entities/cart_product.dart';
import '../../../order/presentation/blocs/cart/cart_cubit.dart';
import '../../domain/entities/product.dart';
import '../blocs/products_cubit/products_cubit.dart';
import '../../../../core/utils/loading_widget.dart';
import '../widgets/product_details_screen/color_and_size_section.dart';
import '../widgets/product_details_screen/images_slider_widget.dart';
import '../widgets/product_details_screen/name_and_price_section.dart';
import '../widgets/product_details_screen/related_products_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.id,
    this.product,
    this.cartProduct,
  }) : super(key: key);

  final int id;
  final Product? product;
  final CartProduct? cartProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product != null ? product!.name : cartProduct!.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state.status == ProductsStatus.productLoading) {
            return const LoadingWidget();
          } else if (state.status == ProductsStatus.error) {
            return const ErrorMessageWiget();
          } else if (state.status == ProductsStatus.loaded) {
            final product =
                state.productsDetails.firstWhere((element) => element.id == id);
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    key: PageStorageKey('ProductDetails:$product.id'),
                    children: [
                      AnimationLimiter(
                        child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                                childAnimationBuilder: (child) =>
                                    SlideAnimation(
                                      verticalOffset: 50.0,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      child: FadeInAnimation(
                                        child: child,
                                      ),
                                    ),
                                children: [
                              ImagesSliderWidget(
                                images: product.images,
                                id: product.id,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 14.h),
                                child: ColorAndSizeSection(
                                  attributes: product.attributes,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                ),
                                child: NameAndPriceSection(product: product),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                ),
                                child: Html(
                                  data: product.shortDescription,
                                  style: {'*': Style(fontSize: FontSize.large)},
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                ),
                                child: RelatedProductsSection(product: product),
                              ),
                              SizedBox(height: 50.h),
                            ])),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: CustomButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).addToCart(
                        product: this.product,
                        newCartProduct: cartProduct,
                      );
                      fToast.init(context);
                      showToast(
                        context: context,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.addedToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.white),
                            ),
                            InkWell(
                              onTap: () {
                                Provider.of<GlobalProvider>(context,
                                        listen: false)
                                    .changeIndex(2);
                                Navigator.pushNamed(context, AppRoutes.main);
                              },
                              child: Text(
                                'View cart',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: AppColors.primaryColorDark,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(AppStrings.addToCart.toUpperCase()),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
