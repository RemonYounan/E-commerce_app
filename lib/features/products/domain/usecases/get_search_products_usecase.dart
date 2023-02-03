import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/repositories/proucts_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/product.dart';

class GetSearchProductsUsecase {
  final ProductsRepository productsRepository;

  GetSearchProductsUsecase(this.productsRepository);

  Future<Either<Failure, List<Product>>> call(String search) async {
    return await productsRepository.getSearchProducts(search);
  }
}
