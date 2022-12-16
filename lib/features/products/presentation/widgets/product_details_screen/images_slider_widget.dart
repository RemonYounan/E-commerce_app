// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/features/products/domain/entities/product_details.dart'
    as product;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_gifs/loading_gifs.dart';

class ImagesSliderWidget extends StatelessWidget {
  const ImagesSliderWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<product.Image> images;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: ListView.builder(
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FadeInImage.assetNetwork(
              image: images[index].img,
              placeholder: cupertinoActivityIndicatorSmall,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.scaleDown,
              width: images.length == 1
                  ? MediaQuery.of(context).size.width
                  : 275.w,
            );
          }),
    );
  }
}
