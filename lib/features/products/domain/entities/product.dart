// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double rate;
  final String img;
  final String priceHtml;
  final double price;
  final String saleDisc;
  final String currencySymbol;
  final String category;
  final String type;
  final bool isNew;
  final bool isOnSale;
  final bool isInStock;

  const Product({
    required this.id,
    required this.name,
    required this.rate,
    required this.img,
    required this.priceHtml,
    required this.price,
    required this.saleDisc,
    required this.currencySymbol,
    required this.category,
    required this.type,
    required this.isNew,
    required this.isOnSale,
    required this.isInStock,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      rate,
      img,
      priceHtml,
      price,
      saleDisc,
      currencySymbol,
      category,
      type,
      isNew,
      isOnSale,
      isInStock,
    ];
  }
}
