import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/proucts_repository.dart';

class GetFavProductsUsecase {
  final ProductsRepository productsRepository;

  const GetFavProductsUsecase(this.productsRepository);

  Future<Either<Failure, dynamic>> call(int id) async {
    return await productsRepository.getFavProducts(id);
  }
}
