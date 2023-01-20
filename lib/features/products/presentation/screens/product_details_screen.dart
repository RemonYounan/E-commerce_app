import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app_routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/providers/global_provider.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../order/domain/entities/cart_product.dart';
import '../../../order/presentation/blocs/cart/cart_cubit.dart';
import '../../domain/entities/product.dart';
import '../blocs/products_cubit/products_cubit.dart';
import '../widgets/loading_widget.dart';
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
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadedState && state.productsDetails.isNotEmpty) {
          final product =
              state.productsDetails.firstWhere((element) => element.id == id);
          return Scaffold(
            appBar: AppBar(
              title: Text(product.name),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    key: PageStorageKey('ProductDetails:$product.id'),
                    children: [
                      ImagesSliderWidget(
                        images: product.images,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 14.h),
                        child: Column(
                          children: [
                            ColorAndSizeSection(
                                attributes: product.attributes, id: product.id),
                            SizedBox(height: 20.h),
                            NameAndPriceSection(product: product),
                            SizedBox(height: 20.h),
                            Html(
                              data: product.shortDescription,
                              style: {'*': Style(fontSize: FontSize.large)},
                            ),
                            SizedBox(height: 20.h),
                            RelatedProductsSection(product: product),
                            SizedBox(height: 100.h),
                          ],
                        ),
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
                          color: AppColors.dark);
                    },
                    child: Text(AppStrings.addToCart.toUpperCase()),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: const LoadingWidget(),
          );
        }
      },
    );
  }
}
