import 'package:ecommerce_app/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.rate,
    required super.img,
    required super.priceHtml,
    required super.price,
    required super.saleDisc,
    required super.currencySymbol,
    required super.category,
    required super.type,
    required super.isNew,
    required super.isOnSale,
    required super.isInStock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: int.parse(json['id'].toString()),
        name: json['name'],
        rate: double.parse(json['rate'].toString()),
        img: json['img'],
        priceHtml: json['priceHTML'],
        price: double.parse(json['price']),
        currencySymbol: json['currency_symbol'],
        category: json['category'],
        type: json['type'],
        saleDisc: json['sale'],
        isInStock: json['in_stock'],
        isNew: json['new'],
        isOnSale: json['is_sale'],
      );
}
