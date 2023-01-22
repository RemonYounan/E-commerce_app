// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/features/products/domain/usecases/get_fav_products_usecase.dart';

import '../../../data/models/banner_model.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/product_model.dart';
import '../../../domain/entities/banner.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/entities/product_details.dart';
import '../../../domain/usecases/get_category_products_usecase.dart';
import '../../../domain/usecases/get_product_details_usecase.dart';
import '../../../domain/usecases/init_data_usecase.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._getProductDetailsUsecase,
    this._getCategoryProductsUsecase,
    this._initDataUsecase,
    this._getFavProductsUsecase,
  ) : super(ProductsInitial());

  final GetProductDetailsUsecase _getProductDetailsUsecase;
  final GetCategoryProductsUsecase _getCategoryProductsUsecase;
  final InitDataUsecase _initDataUsecase;
  final GetFavProductsUsecase _getFavProductsUsecase;
  late ProductsLoadedState _productsLoadedState;

  Map<String, dynamic> _appData = {};
  List<Product> _featuresProducts = [];
  List<Product> _popularProducts = [];
  List<Product> _newestProducts = [];
  List<Product> _favProducts = [];
  List<Category> _categories = [];
  List<Banner> _banners = [];
  final List<ProductDetails> _productsDetails = [];
  Map<String, dynamic> _addressFields = {};
  Map<String, dynamic> _countries = {};

  Map<String, dynamic> get addressFields => _addressFields;
  Map<String, dynamic> get countries => _countries;

  Future<void> initData() async {
    emit(ProductsLoadingState());
    final result = await _initDataUsecase();
    result.fold(
      (error) => emit(ProductsErrorState(message: error.message)),
      (data) {
        _appData = data;
        final List bannersJson = _appData['banners'];
        _banners =
            bannersJson.map((banner) => BannerModel.fromJson(banner)).toList();
        final List featuresProductsJson = _appData['featuresProducts'];
        _featuresProducts = featuresProductsJson
            .map((product) => ProductModel.fromJson(product))
            .toList();
        final List popularProductsJson = _appData['popularProducts'];
        _popularProducts = popularProductsJson
            .map((product) => ProductModel.fromJson(product))
            .toList();
        final List newestProductsJson = _appData['newestProducts'];
        _newestProducts = newestProductsJson
            .map((product) => ProductModel.fromJson(product))
            .toList();
        final List categoriesJson = _appData['categories'];
        _categories = categoriesJson
            .map((category) => CategoryModel.fromJson(category))
            .toList();
        _addressFields = _appData['address_fields'];
        _countries = _appData['countries'];
        emit(
          _productsLoadedState = ProductsLoadedState(
            banners: _banners,
            featuresProducts: _featuresProducts,
            popularProducts: _popularProducts,
            newestProducts: _newestProducts,
            categories: _categories,
          ),
        );
      },
    );
  }

  Future<void> getProduct(int id) async {
    if (_productsDetails.where((element) => element.id == id).isNotEmpty) {
      _productsLoadedState =
          _productsLoadedState.copyWith(productsDetails: _productsDetails);
      emit(_productsLoadedState);
    } else {
      emit(ProductsLoadingState());
      final result = await _getProductDetailsUsecase(id);
      result.fold(
        (error) => emit(ProductsErrorState(message: error.message)),
        (product) {
          _productsDetails.add(product);
          _productsLoadedState =
              _productsLoadedState.copyWith(productsDetails: _productsDetails);
          emit(_productsLoadedState);
        },
      );
    }
  }

  Future<List<Product>> getCategoryProducts(
      int id, int offset, String orderBy) async {
    if (offset == 0) {
      emit(ProductsLoadingState());
    }
    final result = await _getCategoryProductsUsecase(id, offset, orderBy);
    late List<Product> products;
    result.fold(
      (error) => emit(ProductsErrorState(message: error.message)),
      (newProducts) {
        products = newProducts;
        emit(_productsLoadedState);
      },
    );
    return products;
  }

  Future<void> getFavProducts(int id) async {
    if (_favProducts.isEmpty) {
      emit(ProductsLoadingState());
      final result = await _getFavProductsUsecase(id);
      result.fold(
        (error) => emit(ProductsErrorState(message: error.message)),
        (products) {
          _favProducts = products;
          _productsLoadedState = _productsLoadedState.copyWith(
            favProducts: products,
          );
          emit(_productsLoadedState);
        },
      );
    }
  }

  Future<void> refreshFavProducts(int id) async {
    _favProducts = [];
    getFavProducts(id);
  }
}
