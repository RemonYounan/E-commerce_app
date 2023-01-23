part of 'products_bloc.dart';

enum ProductsStatus { loading, productLoading, loaded, error }

class ProductsState extends Equatable {
  final List<Product> featuresProducts;
  final List<Product> popularProducts;
  final List<Product> newestProducts;
  final List<Product> favProducts;
  final List<Product> catProducts;
  final List<ProductDetails> productsDetails;
  final List<Category> categories;
  final List<Banner> banners;
  ProductsStatus status;
  final String errorMessage;

  ProductsState({
    this.featuresProducts = const [],
    this.popularProducts = const [],
    this.newestProducts = const [],
    this.favProducts = const [],
    this.catProducts = const [],
    this.productsDetails = const [],
    this.categories = const [],
    this.banners = const [],
    this.status = ProductsStatus.loading,
    this.errorMessage = '',
  });
  @override
  List<Object> get props => [
        featuresProducts,
        popularProducts,
        newestProducts,
        favProducts,
        catProducts,
        productsDetails,
        categories,
        banners,
        status,
        errorMessage,
      ];

  ProductsState copyWith({
    List<Product>? featuresProducts,
    List<Product>? popularProducts,
    List<Product>? newestProducts,
    List<Product>? favProducts,
    List<Product>? catProducts,
    List<Category>? categories,
    List<Banner>? banners,
    List<ProductDetails>? productsDetails,
    ProductsStatus? status,
    String? errorMessage,
  }) =>
      ProductsState(
        featuresProducts: featuresProducts ?? this.featuresProducts,
        popularProducts: popularProducts ?? this.popularProducts,
        newestProducts: newestProducts ?? this.newestProducts,
        favProducts: favProducts ?? this.favProducts,
        catProducts: catProducts ?? this.catProducts,
        categories: categories ?? this.categories,
        banners: banners ?? this.banners,
        productsDetails: productsDetails ?? this.productsDetails,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
