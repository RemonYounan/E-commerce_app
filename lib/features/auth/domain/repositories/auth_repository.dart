import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/auth/domain/entities/login.dart';
import 'package:ecommerce_app/features/auth/domain/entities/register.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register(Register register);
  Future<Either<Failure, User>> login(Login login);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, User>> loginWithFacebook();
  Future<Either<Failure, User>> loginWithGoogle();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, User>> checkAuthToken(String auth);
}
