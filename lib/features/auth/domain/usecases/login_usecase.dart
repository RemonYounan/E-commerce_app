import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/login.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<Either<Failure, User>> call(Login login) async {
    return await authRepository.login(login);
  }
}
