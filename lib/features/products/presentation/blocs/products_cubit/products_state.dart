// part of 'products_cubit.dart';

// enum ProductsStatus { loading, loaded, error }

// // ignore: must_be_immutable
// class ProductsState extends Equatable {
//   final List<Product> featuresProducts;
//   final List<Product> popularProducts;
//   final List<Product> newestProducts;
//   final List<Product> favProducts;
//   final List<ProductDetails> productsDetails;
//   final List<Category> categories;
//   final List<Banner> banners;
//   ProductsStatus status;
//   String errorMessage;

//   ProductsState({
//     this.featuresProducts = const [],
//     this.popularProducts = const [],
//     this.newestProducts = const [],
//     this.favProducts = const [],
//     this.productsDetails = const [],
//     this.categories = const [],
//     this.banners = const [],
//     this.status = ProductsStatus.loading,
//     this.errorMessage = '',
//   });
//   @override
//   List<Object> get props => [
//         featuresProducts,
//         popularProducts,
//         newestProducts,
//         favProducts,
//         productsDetails,
//         categories,
//         banners,
//         status,
//         errorMessage,
//       ];

//   ProductsState copyWith({
//     List<Product>? featuresProducts,
//     List<Product>? popularProducts,
//     List<Product>? newestProducts,
//     List<Product>? favProducts,
//     List<Category>? categories,
//     List<Banner>? banners,
//     List<ProductDetails>? productsDetails,
//     ProductsStatus? status,
//     String? errorMessage,
//   }) =>
//       ProductsState(
//         featuresProducts: featuresProducts ?? this.featuresProducts,
//         popularProducts: popularProducts ?? this.popularProducts,
//         newestProducts: newestProducts ?? this.newestProducts,
//         favProducts: favProducts ?? this.favProducts,
//         categories: categories ?? this.categories,
//         banners: banners ?? this.banners,
//         productsDetails: productsDetails ?? this.productsDetails,
//         status: status ?? this.status,
//         errorMessage: errorMessage ?? this.errorMessage,
//       );
// }
