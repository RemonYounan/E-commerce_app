// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<Product> featuresProducts;
  final List<Product> popularProducts;
  final List<Product> newestProducts;
  final List<ProductDetails> productsDetails;
  final List<Category> categories;
  final List<Banner> banners;

  const ProductsLoadedState({
    this.featuresProducts = const [],
    this.popularProducts = const [],
    this.newestProducts = const [],
    this.productsDetails = const [],
    this.categories = const [],
    this.banners = const [],
  });
  @override
  List<Object> get props => [
        featuresProducts,
        popularProducts,
        newestProducts,
        productsDetails,
        categories,
        banners
      ];

  ProductsLoadedState copyWith({
    List<Product>? featuresProducts,
    List<Product>? popularProducts,
    List<Product>? newestProducts,
    List<Category>? categories,
    List<Banner>? banners,
    List<ProductDetails>? productsDetails,
  }) =>
      ProductsLoadedState(
        featuresProducts: featuresProducts ?? this.featuresProducts,
        popularProducts: popularProducts ?? this.popularProducts,
        newestProducts: newestProducts ?? this.newestProducts,
        categories: categories ?? this.categories,
        banners: banners ?? this.banners,
        productsDetails: productsDetails ?? this.productsDetails,
      );
}

class ProductsErrorState extends ProductsState {
  final String message;

  const ProductsErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
