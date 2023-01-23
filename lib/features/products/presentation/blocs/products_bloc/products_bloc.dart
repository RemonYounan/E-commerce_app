// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/products/data/models/banner_model.dart';
import 'package:ecommerce_app/features/products/data/models/category_model.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/features/products/domain/entities/banner.dart';
import 'package:ecommerce_app/features/products/domain/entities/category.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/entities/product_details.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_category_products_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_fav_products_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_product_details_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/init_data_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final InitDataUsecase _initDataUsecase;
  final GetProductDetailsUsecase _getProductDetailsUsecase;
  final GetCategoryProductsUsecase _getCategoryProductsUsecase;
  final GetFavProductsUsecase _getFavProductsUsecase;

  final List<ProductDetails> _productsDetails = [];
  final List<Product> _favProducts = [];
  List<Product> _catProducts = [];
  Map<String, dynamic> _addressFields = {};
  Map<String, dynamic> _countries = {};

  List<Product> get catProducts => _catProducts;
  Map<String, dynamic> get addressFields => _addressFields;
  Map<String, dynamic> get countries => _countries;

  ProductsBloc(
    this._getProductDetailsUsecase,
    this._getCategoryProductsUsecase,
    this._initDataUsecase,
    this._getFavProductsUsecase,
  ) : super(ProductsState()) {
    on<ProductsEvent>((event, emit) async {
      Future<List<Product>> getCategoryProducts(
          int id, int offset, String orderBy) async {
        if (offset == 0) {
          emit(state.copyWith(status: ProductsStatus.loading));
        }
        final result = await _getCategoryProductsUsecase(id, offset, orderBy);
        late List<Product> products;
        result.fold(
          (error) => emit(state.copyWith(
            status: ProductsStatus.error,
            errorMessage: error.message,
          )),
          (newProducts) {
            products = newProducts;
            emit(state);
          },
        );
        return products;
      }

      if (event is InitDataEvent) {
        final result = await _initDataUsecase();
        result.fold(
          (error) => emit(state.copyWith(
            status: ProductsStatus.error,
            errorMessage: error.message,
          )),
          (data) {
            final appData = data;
            final List bannersJson = appData['banners'];
            final banners = bannersJson
                .map((banner) => BannerModel.fromJson(banner))
                .toList();
            final List featuresProductsJson = appData['featuresProducts'];
            final featuresProducts = featuresProductsJson
                .map((product) => ProductModel.fromJson(product))
                .toList();
            final List popularProductsJson = appData['popularProducts'];
            final popularProducts = popularProductsJson
                .map((product) => ProductModel.fromJson(product))
                .toList();
            final List newestProductsJson = appData['newestProducts'];
            final newestProducts = newestProductsJson
                .map((product) => ProductModel.fromJson(product))
                .toList();
            final List categoriesJson = appData['categories'];
            final categories = categoriesJson
                .map((category) => CategoryModel.fromJson(category))
                .toList();
            _addressFields = appData['address_fields'];
            _countries = appData['countries'];
            emit(state.copyWith(
                banners: banners,
                featuresProducts: featuresProducts,
                popularProducts: popularProducts,
                newestProducts: newestProducts,
                categories: categories,
                status: ProductsStatus.loaded));
          },
        );
      } else if (event is GetProductEvent) {
        if (_productsDetails
            .where((element) => element.id == event.id)
            .isNotEmpty) {
          emit(state.copyWith(status: ProductsStatus.loaded));
        } else {
          emit(state.copyWith(status: ProductsStatus.productLoading));
          final result = await _getProductDetailsUsecase(event.id);
          result.fold(
            (error) => emit(state.copyWith(
              status: ProductsStatus.error,
              errorMessage: error.message,
            )),
            (product) {
              _productsDetails.add(product);
              emit(state.copyWith(
                productsDetails: _productsDetails,
                status: ProductsStatus.loaded,
              ));
            },
          );
        }
      } else if (event is GetCategoryProductsEvent) {
        getCategoryProducts(event.id, event.id, event.orderBy);
      } else if (event is GetFavProductsEvent) {
        if (_favProducts.isEmpty) {
          emit(state.copyWith(status: ProductsStatus.loading));
          final result = await _getFavProductsUsecase(event.id);
          result.fold(
            (error) => emit(state.copyWith(
              status: ProductsStatus.error,
              errorMessage: error.message,
            )),
            (products) {
              _favProducts.addAll(products);
              emit(state.copyWith(
                favProducts: products,
                status: ProductsStatus.loaded,
              ));
            },
          );
        }
      } else if (event is RefreshFavProductsEvent) {
        _favProducts.clear();
        emit(state.copyWith(status: ProductsStatus.loading));
        final result = await _getFavProductsUsecase(event.id);
        result.fold(
          (error) => emit(state.copyWith(
            status: ProductsStatus.error,
            errorMessage: error.message,
          )),
          (products) {
            _favProducts.addAll(products);
            emit(state.copyWith(
              favProducts: products,
              status: ProductsStatus.loaded,
            ));
          },
        );
      }
    });
  }
}
