import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/domain/entities/product_details.dart';
import 'package:ecommerce_app/features/products/domain/repositories/proucts_repository.dart';

class GetProductDetailsUsecase {
  ProductsRepository productsRepository;

  GetProductDetailsUsecase(this.productsRepository);

  Future<Either<Failure, ProductDetails>> call(int id) async {
    return await productsRepository.getProduct(id); 
  }
}
