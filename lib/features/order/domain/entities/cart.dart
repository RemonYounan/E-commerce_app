import 'cart_product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<CartProduct>? products;
  double totalAmount;

  Cart({
    this.products,
    this.totalAmount = 0,
  });

  @override
  List<Object?> get props => [products, totalAmount];
}
