// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_model.dart';
import 'package:ecommerce_app/features/auth/data/models/register_model.dart';
import 'package:ecommerce_app/features/auth/domain/entities/login.dart';
import 'package:ecommerce_app/features/auth/domain/entities/register.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> checkAuthToken(String auth) async {
    return await authRemoteDataSource.checkAuthToken(auth);
  }

  @override
  Future<Either<Failure, User>> register(Register register) async {
    final data = RegisterModel(
      email: register.email,
      name: register.name,
      passwrod: register.passwrod,
    );
    return await authRemoteDataSource.register(data);
  }

  @override
  Future<Either<Failure, User>> login(Login login) async {
    final loginModel = LoginModel(email: login.email, password: login.password);
    return await authRemoteDataSource.login(loginModel);
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    return await authRemoteDataSource.forgotPassword(email);
  }

  @override
  Future<Either<Failure, User>> loginWithFacebook() async {
    return await authRemoteDataSource.loginWithFacebook();
  }

  @override
  Future<Either<Failure, User>> loginWithGoogle() async {
    return await authRemoteDataSource.loginWithGoogle();
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    return await authRemoteDataSource.logout();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addAddress(
      int id, Map<String, dynamic> address) async {
    return await authRemoteDataSource.addAddress(id, address);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> removeAddress(int id, String key) async {
    return await authRemoteDataSource.removeAddress(id, key);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getStates(String key) async {
    return await authRemoteDataSource.getStates(key);
  }
}
