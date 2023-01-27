import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';

class AddAddressUsecase {
  final AuthRepository authRepository;

  AddAddressUsecase(
    this.authRepository,
  );

  Future<Either<Failure, Map<String, dynamic>>> call(
      int id, Map<String, dynamic> address) async {
    return await authRepository.addAddress(id, address);
  }
}
