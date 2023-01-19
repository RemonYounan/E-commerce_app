import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogleUsecase {
  final AuthRepository authRepository;

  LoginWithGoogleUsecase(this.authRepository);

  Future<Either<Failure, User>> call() async {
    return await authRepository.loginWithGoogle();
  }
}
