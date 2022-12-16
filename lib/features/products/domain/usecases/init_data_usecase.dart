import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/domain/repositories/proucts_repository.dart';

class InitDataUsecase {
  ProductsRepository productsRepository;

  InitDataUsecase(this.productsRepository);
  Future<Either<Failure, Map<String, dynamic>>> call() async {
    return await productsRepository.initData();
  }
}
