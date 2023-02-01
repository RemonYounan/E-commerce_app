part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartEmptyState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  const CartLoadedState({
    required this.cart,
  });

  final Cart cart;

  @override
  List<Object> get props => [cart];
}

class ProductAddedState extends CartState {}

class ProductRemovedState extends CartState {}
