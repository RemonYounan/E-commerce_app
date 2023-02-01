import 'cart_product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  List<CartProduct> products;
  double totalAmount;

  Cart({
    this.products = const [],
    this.totalAmount = 0,
  });

  @override
  List<Object?> get props => [products, totalAmount];

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        products: List.from(
          json['products'].map((e) => CartProduct.fromJson(e)),
        ),
        totalAmount: json['totalAmount'],
      );

  Map<String, dynamic> toJson() => {
        'products': products.map((e) => e.toJson()).toList(),
        'totalAmount': totalAmount,
      };
}
