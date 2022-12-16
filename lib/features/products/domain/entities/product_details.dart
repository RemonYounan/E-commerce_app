// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/features/products/domain/entities/product.dart';

class ProductDetails extends Equatable {
  final int id;
  final String name;
  final String type;
  final String status;
  final bool isFeatured;
  final String description;
  final String shortDescription;
  final double price;
  final String priceHtml;
  final bool isPurchasable;
  final bool isOnSale;
  final int totalSales;
  final double weight;
  final Dimensions dimensions;
  final double avgRating;
  final int ratingCount;
  final String category;
  final List tags;
  final List<Image> images;
  final List<int> relatedIds;
  final List<Attribute> attributes;
  final List<Product> related;
  //ToDO : make Object for Review
  final List reviews;

  const ProductDetails({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.isFeatured,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.priceHtml,
    required this.isPurchasable,
    required this.isOnSale,
    required this.totalSales,
    required this.weight,
    required this.dimensions,
    required this.avgRating,
    required this.ratingCount,
    required this.category,
    required this.tags,
    required this.images,
    required this.relatedIds,
    required this.attributes,
    required this.related,
    required this.reviews,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      type,
      status,
      isFeatured,
      description,
      shortDescription,
      price,
      priceHtml,
      isPurchasable,
      isOnSale,
      totalSales,
      weight,
      dimensions,
      avgRating,
      ratingCount,
      category,
      tags,
      images,
      relatedIds,
      reviews,
    ];
  }
}

class Attribute extends Equatable {
  final int id;
  final String name;
  final List<String> options;

  const Attribute({
    required this.id,
    required this.name,
    required this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json['id'],
        name: json['name'],
        options: List.from(json['options'].map((e) => e)),
      );

  @override
  List<Object> get props => [id, name, options];
}

class Dimensions extends Equatable {
  final double length;
  final double width;
  final double height;

  const Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: double.tryParse(json['length']) ?? 0,
        width: double.tryParse(json['width']) ?? 0,
        height: double.tryParse(json['height']) ?? 0,
      );

  @override
  List<Object> get props => [length, width, height];
}

class Image extends Equatable {
  final int id;
  final String name;
  final String img;

  const Image({
    required this.id,
    required this.name,
    required this.img,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'],
        name: json['name'],
        img: json['src'],
      );

  @override
  List<Object> get props => [id, name, img];
}
