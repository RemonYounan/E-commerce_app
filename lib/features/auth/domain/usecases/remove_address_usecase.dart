// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class RemoveAddressUsecase {
  final AuthRepository authRepository;

  const RemoveAddressUsecase(
    this.authRepository,
  );

  Future<Either<Failure, Map<String, dynamic>>> call(int id, String key) async {
    return await authRepository.removeAddress(id, key);
  }
}
