// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class InitDataEvent extends ProductsEvent {}

class GetProductEvent extends ProductsEvent {
  final int id;

  const GetProductEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class GetCategoryProductsEvent extends ProductsEvent {
  final int id;
  final int offset;
  final String orderBy;

  const GetCategoryProductsEvent({
    required this.id,
    required this.offset,
    required this.orderBy,
  });

  @override
  List<Object> get props => [id, offset, orderBy];
}

class GetFavProductsEvent extends ProductsEvent {
  final int id;

  const GetFavProductsEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
class RefreshFavProductsEvent extends ProductsEvent {
   final int id;

  const RefreshFavProductsEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
