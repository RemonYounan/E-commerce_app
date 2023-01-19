import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class CheckAuthTokenUsecase {
  final AuthRepository authRepository;

  CheckAuthTokenUsecase(
    this.authRepository,
  );
   Future<Either<Failure, User>> call(String auth) async {
    return await authRepository.checkAuthToken(auth);
  }
}
