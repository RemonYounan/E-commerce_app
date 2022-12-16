import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/domain/repositories/proucts_repository.dart';

class GetFavProductsUsecase {
  final ProductsRepository productsRepository;

  GetFavProductsUsecase(this.productsRepository);

  // Future<Either<Failure, dynamic>> call() async {
    // return await productsRepository.getFavProducts();
  // }
}
