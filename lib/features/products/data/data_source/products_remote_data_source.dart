// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';

import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/data/models/product_details_model.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/entities/product_details.dart';

abstract class ProductsRemoteDataSource {
  Future<Either<Failure, Map<String, dynamic>>> initData();
  Future<Either<Failure, dynamic>> toggleFavorite(int id, int uid);
  Future<Either<Failure, ProductDetails>> getProduct(int id);
  Future<Either<Failure, List<Product>>> getFavProducts(int id);
  Future<Either<Failure, List<Product>>> getCategoryProducts(
      int id, int offset, String orderBy);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  Dio dio;

  ProductsRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<Failure, Map<String, dynamic>>> initData() async {
    final response = await dio.get(AppConstants.initDataPathUrl);
    if (response.statusCode == 200) {
      return Right(response.data);
    } else {
      return Left(ServerFailure(message: response.data['error']));
    }
  }

  @override
  Future<Either<Failure, dynamic>> toggleFavorite(int id, int uid) async {
    final response = await dio.get(
      AppConstants.toggleFavoritePathUrl,
      queryParameters: {
        'id': id,
        'uid': uid,
      },
    );
    if (response.statusCode == 200) {
      return Right(response.data);
    } else {
      return Left(ServerFailure(message: response.data['error']));
    }
  }

  @override
  Future<Either<Failure, ProductDetails>> getProduct(int id) async {
    final response =
        await dio.get(AppConstants.getProductPathUrl, queryParameters: {
      'id': id,
    });
    if (response.statusCode == 200) {
      return Right(ProductDetailsModel.fromJson(response.data));
    } else {
      return Left(ServerFailure(message: response.data['error']));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getCategoryProducts(
      int id, int offset, String orderBy) async {
    final response =
        await dio.get(AppConstants.getProductsPathUrl, queryParameters: {
      'catID': id,
      'search': '',
      'orderBy': orderBy,
      'offset': offset,
    });
    if (response.statusCode == 200) {
      final List productsJson = response.data;
      return Right(productsJson
          .map((product) => ProductModel.fromJson(product))
          .toList());
    } else {
      return Left(ServerFailure(message: response.data['error']));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getFavProducts(int id) async {
    try {
      final response = await dio.get(
        AppConstants.getFavoritePathUrl,
        queryParameters: {'id': id},
      );
      if (response.statusCode == 200) {
        final List productsJson = response.data;
        return Right(productsJson
            .map((product) => ProductModel.fromJson(product))
            .toList());
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }
}
