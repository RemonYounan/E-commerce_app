import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class ForgotPasswordUsecase {
  final AuthRepository authRepository;

  ForgotPasswordUsecase(this.authRepository);

  Future<Either<Failure, String>> call(String email) async {
    return await authRepository.forgotPassword(email);
  }
}
