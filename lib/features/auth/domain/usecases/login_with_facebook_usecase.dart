import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class LoginWithFacebookUsecase {
  final AuthRepository authRepository;

  LoginWithFacebookUsecase(this.authRepository);

   Future<Either<Failure, User>> call() async {
    return await authRepository.loginWithFacebook();
  }
}
