import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/login.dart';
import '../entities/register.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register(Register register);
  Future<Either<Failure, User>> login(Login login);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, User>> loginWithFacebook();
  Future<Either<Failure, User>> loginWithGoogle();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, User>> checkAuthToken(String auth);
  Future<Either<Failure, Map<String, dynamic>>> addAddress(int id,Map<String, dynamic> address);
  Future<Either<Failure, Map<String, dynamic>>> removeAddress(int id,String key);
  Future<Either<Failure,Map<String,dynamic>>> getStates(String key);
}
