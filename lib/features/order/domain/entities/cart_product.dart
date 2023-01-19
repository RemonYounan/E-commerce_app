import 'package:equatable/equatable.dart';

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
}
