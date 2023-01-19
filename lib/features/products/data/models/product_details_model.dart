import 'product_model.dart';
import '../../domain/entities/product_details.dart';

class ProductDetailsModel extends ProductDetails {
  const ProductDetailsModel({
    required super.id,
    required super.name,
    required super.type,
    required super.status,
    required super.isFeatured,
    required super.description,
    required super.shortDescription,
    required super.price,
    required super.priceHtml,
    required super.isPurchasable,
    required super.isOnSale,
    required super.totalSales,
    required super.weight,
    required super.dimensions,
    required super.avgRating,
    required super.ratingCount,
    required super.category,
    required super.tags,
    required super.images,
    required super.relatedIds,
    required super.attributes,
    required super.related,
    required super.reviews,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        status: json['status'],
        isFeatured: json['featured'],
        description: json['description'],
        shortDescription: json['short_description'],
        price: double.tryParse(json['price'])!,
        priceHtml: json['price_html'],
        isPurchasable: json['purchasable'],
        isOnSale: json['on_sale'],
        totalSales: json['total_sales'],
        weight: double.tryParse(json['weight']) ?? 0,
        dimensions: Dimensions.fromJson(json['dimensions']),
        avgRating: double.parse(json['average_rating']),
        ratingCount: json['rating_count'],
        category: json['categories'][0]['name'],
        tags: json['tags'],
        images: List.from(json['images'].map((img) => Image.fromJson(img))),
        relatedIds: List.from(json['related_ids'].map((id) => id)),
        reviews: json['reviews'],
        related: List.from(json['related'].map((prod) => ProductModel.fromJson(prod))),
        attributes: List.from(
            json['attributes'].map((attr) => Attribute.fromJson(attr))),
      );
}
