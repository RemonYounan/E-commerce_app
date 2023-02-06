import 'package:cached_network_image/cached_network_image.dart';

import 'package:ecommerce_app/core/utils/placeholder_loading_widget.dart';
import 'package:ecommerce_app/features/products/domain/entities/product_details.dart'
    as product;
import 'package:ecommerce_app/features/products/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSliderWidget extends StatelessWidget {
  const ImagesSliderWidget({
    Key? key,
    required this.images,
    required this.id,
  }) : super(key: key);

  final List<product.Image> images;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: images[index].img,
                  fit: BoxFit.cover,
                  width: images.length == 1
                      ? MediaQuery.of(context).size.width
                      : 275.w,
                  placeholder: (context, url) =>
                      const PlaceholderLoadingWidget(),
                ),
              );
            },
          ),
          Positioned(
            right: 6.w,
            bottom: 5.h,
            child: FavoriteButton(id: id),
          ),
        ],
      ),
    );
  }
}
