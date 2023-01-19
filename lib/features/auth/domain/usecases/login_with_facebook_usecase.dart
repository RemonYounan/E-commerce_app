import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginWithFacebookUsecase {
  final AuthRepository authRepository;

  LoginWithFacebookUsecase(this.authRepository);

   Future<Either<Failure, User>> call() async {
    return await authRepository.loginWithFacebook();
  }
}
