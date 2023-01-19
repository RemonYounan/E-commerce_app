import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product_details.dart';
import '../repositories/proucts_repository.dart';

class GetProductDetailsUsecase {
  ProductsRepository productsRepository;

  GetProductDetailsUsecase(this.productsRepository);

  Future<Either<Failure, ProductDetails>> call(int id) async {
    return await productsRepository.getProduct(id); 
  }
}
