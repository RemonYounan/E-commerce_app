import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/proucts_repository.dart';

class InitDataUsecase {
  ProductsRepository productsRepository;

  InitDataUsecase(this.productsRepository);
  Future<Either<Failure, Map<String, dynamic>>> call() async {
    return await productsRepository.initData();
  }
}
