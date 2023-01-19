import '../repositories/proucts_repository.dart';

class GetFavProductsUsecase {
  final ProductsRepository productsRepository;

  GetFavProductsUsecase(this.productsRepository);

  // Future<Either<Failure, dynamic>> call() async {
    // return await productsRepository.getFavProducts();
  // }
}
