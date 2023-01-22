import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../entities/product_details.dart';

abstract class ProductsRepository {
  Future<Either<Failure, Map<String, dynamic>>> initData();
  Future<Either<Failure, dynamic>> toggleFavorite(int id, int uid);
  Future<Either<Failure, ProductDetails>> getProduct(int id);
  Future<Either<Failure, List<Product>>> getFavProducts(int id);
  Future<Either<Failure, List<Product>>> getCategoryProducts(
      int id, int offset, String orderBy);
}
