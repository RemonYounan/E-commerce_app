import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Map<String, dynamic>>> getStates(String key);
}
