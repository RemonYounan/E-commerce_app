import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/products/data/models/banner_model.dart';
import 'package:ecommerce_app/features/products/data/models/category_model.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/domain/entities/banner.dart';
import 'package:ecommerce_app/features/products/domain/entities/category.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/entities/product_details.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_category_products_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_product_details_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/init_data_usecase.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._initDataUsecase,
    this._getCategoryProductsUsecase,
    this._getProductDetailsUsecase,
  ) : super(ProductsInitial());

  final GetProductDetailsUsecase _getProductDetailsUsecase;
  final GetCategoryProductsUsecase _getCategoryProductsUsecase;
  final InitDataUsecase _initDataUsecase;
  late ProductsLoadedState _productsLoadedState;

  Map<String, dynamic> appData = {};
  List<Product> _featuresProducts = [];
  List<Product> _popularProducts = [];
  List<Product> _newestProducts = [];
  List<Category> _categories = [];
  List<Banner> _banners = [];
  final List<ProductDetails> _productsDetails = [];

  Future<void> initData() async {
    emit(ProductsLoadingState());
    final result = await _initDataUsecase();
    result.fold(
      (error) => emit(ProductsErrorState(message: error.message)),
      (data) {
        appData = data;
      },
    );
    final List bannersJson = appData['banners'];
    _banners =
        bannersJson.map((banner) => BannerModel.fromJson(banner)).toList();
    final List featuresProductsJson = appData['featuresProducts'];
    _featuresProducts = featuresProductsJson
        .map((product) => ProductModel.fromJson(product))
        .toList();
    final List popularProductsJson = appData['popularProducts'];
    _popularProducts = popularProductsJson
        .map((product) => ProductModel.fromJson(product))
        .toList();
    final List newestProductsJson = appData['newestProducts'];
    _newestProducts = newestProductsJson
        .map((product) => ProductModel.fromJson(product))
        .toList();
    final List categoriesJson = appData['categories'];
    _categories = categoriesJson
        .map((category) => CategoryModel.fromJson(category))
        .toList();
    emit(
      _productsLoadedState = ProductsLoadedState(
        banners: _banners,
        featuresProducts: _featuresProducts,
        popularProducts: _popularProducts,
        newestProducts: _newestProducts,
        categories: _categories,
      ),
    );
  }

  Future<void> getProduct(int id) async {
    emit(ProductsLoadingState());
    if (_productsDetails.where((element) => element.id == id).isNotEmpty) {
      _productsLoadedState =
          _productsLoadedState.copyWith(productsDetails: _productsDetails);
      emit(_productsLoadedState);
    } else {
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
}
