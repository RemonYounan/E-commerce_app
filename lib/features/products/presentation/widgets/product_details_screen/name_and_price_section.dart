import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_text_styles.dart';
import '../../../domain/entities/product_details.dart';
import '../rate_widget.dart';

class NameAndPriceSection extends StatelessWidget {
  const NameAndPriceSection({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: AppTextStyle.headlineTextStyle2(context),
              ),
              Text(
                product.category,
                style: AppTextStyle.helperTextStyle2(context),
              ),
              SizedBox(
                height: 2.h,
              ),
              RateWidget(rate: product.avgRating.toInt()),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
            flex: 2,
            child: Text(
              '\$${product.price}',
              style: AppTextStyle.headlineTextStyle2(context),
            )),
      ],
    );
  }
}
