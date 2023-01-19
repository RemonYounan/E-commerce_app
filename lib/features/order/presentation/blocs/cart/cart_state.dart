// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  final Cart cart;
  const CartState({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
}

class CartLoading extends CartState {
  const CartLoading({required super.cart});
  @override
  List<Object> get props => [cart];
}

class ProductAddedState extends CartState {
  const ProductAddedState({required super.cart});

  @override
  List<Object> get props => [cart];
}

class ProductRemovedState extends CartState {
  const ProductRemovedState({required super.cart});

  @override
  List<Object> get props => [cart];
}
