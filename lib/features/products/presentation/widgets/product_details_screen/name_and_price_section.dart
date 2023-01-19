import '../../../domain/entities/product_details.dart';
import '../rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                product.category,
                style: Theme.of(context).textTheme.labelSmall,
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
              style: Theme.of(context).textTheme.headlineMedium,
            )),
      ],
    );
  }
}
