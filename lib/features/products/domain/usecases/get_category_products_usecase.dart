import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/proucts_repository.dart';

class GetCategoryProductsUsecase {
  ProductsRepository productsRepository;

  GetCategoryProductsUsecase(this.productsRepository);
  Future<Either<Failure, List<Product>>> call(int id,int offset,String orderBy) async {
    return await productsRepository.getCategoryProducts(id,offset,orderBy);
  }
}
