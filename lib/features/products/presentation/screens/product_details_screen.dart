// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/loading_widget.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_details_screen/color_and_size_section.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_details_screen/images_slider_widget.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_details_screen/name_and_price_section.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_details_screen/related_products_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

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
                    key: PageStorageKey('ProductDetails:$id'),
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
                    onPressed: () {},
                    child: Text('add_to_cart'.tr().toUpperCase()),
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
