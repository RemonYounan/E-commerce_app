import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class GetStateUsecase {
  final AuthRepository authRepository;

  const GetStateUsecase(this.authRepository);

  Future<Either<Failure, Map<String, dynamic>>> call(String key) async {
    return await authRepository.getStates(key);
  }
}
