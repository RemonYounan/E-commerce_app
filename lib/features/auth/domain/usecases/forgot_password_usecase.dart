import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUsecase {
  final AuthRepository authRepository;

  ForgotPasswordUsecase(this.authRepository);

  Future<Either<Failure, String>> call(String email) async {
    return await authRepository.forgotPassword(email);
  }
}
