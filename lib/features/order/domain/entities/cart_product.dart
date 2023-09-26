import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartProduct extends Equatable {
  final int id;
  final String name;
  final double price;
  final String img;
  final String category;
  final bool isNew;
  final bool isOnSale;
  final String saleDisc;
  int count;

  CartProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.category,
    required this.count,
    required this.isOnSale,
    required this.isNew,
    required this.saleDisc,
  });

  @override
  List<Object?> get props =>
      [id, name, price, category, img, count, isNew, isOnSale, saleDisc];

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        img: json['img'],
        category: json['category'],
        count: json['count'],
        isOnSale: json['isOnSale'],
        isNew: json['isNew'],
        saleDisc: json['saleDisc'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'img': img,
        'category': category,
        'count': count,
        'isOnSale': isOnSale,
        'isNew': isNew,
        'saleDisc': saleDisc,
      };
}
