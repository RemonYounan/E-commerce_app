import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/proucts_repository.dart';

class GetCategoryProductsUsecase {
  final ProductsRepository productsRepository;

  const GetCategoryProductsUsecase(this.productsRepository);
  Future<Either<Failure, List<Product>>> call(
      int id, int offset, String orderBy) async {
    return await productsRepository.getCategoryProducts(id, offset, orderBy);
  }
}
