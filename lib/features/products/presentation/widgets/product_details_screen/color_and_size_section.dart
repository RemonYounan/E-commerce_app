import 'package:ecommerce_app/features/products/domain/entities/product_details.dart';
import 'package:flutter/material.dart';

import 'choos_size_or_color_widget.dart';

class ColorAndSizeSection extends StatelessWidget {
  const ColorAndSizeSection({
    Key? key,
    required this.attributes,
  }) : super(key: key);

  final List<Attribute> attributes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...attributes.reversed.map(
          (attr) => Expanded(
            child:
                ChooseSizeOrColorWidget(name: attr.name, items: attr.options),
          ),
        ),
        attributes.isEmpty ? const Spacer() : const SizedBox(),
      ],
    );
  }
}
