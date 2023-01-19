// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/features/products/domain/entities/product_details.dart';
import 'package:flutter/material.dart';

import '../favorite_button.dart';
import 'choos_size_or_color_widget.dart';

class ColorAndSizeSection extends StatelessWidget {
  const ColorAndSizeSection({
    Key? key,
    required this.attributes,
    required this.id,
  }) : super(key: key);

  final List<Attribute> attributes;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...attributes.reversed.map(
          (attr) => Expanded(
            flex: 2,
            child:
                ChooseSizeOrColorWidget(name: attr.name, items: attr.options),
          ),
        ),
        attributes.isEmpty ? const Spacer() : const SizedBox(),
        Expanded(child: FavoriteButton(id: id)),
      ],
    );
  }
}
