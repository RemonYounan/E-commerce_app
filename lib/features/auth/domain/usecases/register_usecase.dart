import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/register.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase(this.authRepository);

  Future<Either<Failure, User>> call(Register register) async {
    return await authRepository.register(register);
  }
}
