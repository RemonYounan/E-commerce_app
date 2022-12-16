import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class CheckAuthTokenUsecase {
  final AuthRepository authRepository;

  CheckAuthTokenUsecase(
    this.authRepository,
  );
   Future<Either<Failure, User>> call(String auth) async {
    return await authRepository.checkAuthToken(auth);
  }
}
