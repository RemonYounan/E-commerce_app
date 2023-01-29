import 'package:ecommerce_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/profile/data/data_sources/profile_api.dart';
import 'package:ecommerce_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final PrfoileApi prfoileApi;

  const ProfileRepositoryImpl(this.prfoileApi);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getStates(String key) async {
    return await prfoileApi.getStates(key);
  }
}
