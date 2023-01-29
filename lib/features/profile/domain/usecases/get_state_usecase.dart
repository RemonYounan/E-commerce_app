import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/profile/domain/repositories/profile_repository.dart';

class GetStateUsecase {
  final ProfileRepository profileRepository;

  const GetStateUsecase(this.profileRepository);

  Future<Either<Failure, Map<String, dynamic>>> call(String key) async {
    return await profileRepository.getStates(key);
  }
}
