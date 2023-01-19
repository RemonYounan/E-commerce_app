import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/proucts_repository.dart';

class ToggleFavoriteUsecase {
  final ProductsRepository productsRepository;

  ToggleFavoriteUsecase(this.productsRepository);

   Future<Either<Failure, dynamic>> call(int id,int uid) async {
    return await productsRepository.toggleFavorite(id,uid);
  }
}
