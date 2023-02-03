import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/data/data_source/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/entities/product_details.dart';
import 'package:ecommerce_app/features/products/domain/repositories/proucts_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getCategoryProducts(
      int id, int offset, String orderBy) async {
    return await remoteDataSource.getCategoryProducts(id, offset, orderBy);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> initData() async {
    return await remoteDataSource.initData();
  }

  @override
  Future<Either<Failure, dynamic>> toggleFavorite(int id, int uid) async {
    return await remoteDataSource.toggleFavorite(id, uid);
  }

  @override
  Future<Either<Failure, ProductDetails>> getProduct(int id) async {
    return await remoteDataSource.getProduct(id);
  }

  @override
  Future<Either<Failure, List<Product>>> getFavProducts(int id) async {
    return await remoteDataSource.getFavProducts(id);
  }

  @override
  Future<Either<Failure, List<Product>>> getSearchProducts(
      String search) async {
    return await remoteDataSource.getSearchProducts(search);
  }
}
