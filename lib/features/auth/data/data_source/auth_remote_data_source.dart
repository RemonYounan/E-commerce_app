import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, User>> register(RegisterModel data);
  Future<Either<Failure, User>> login(LoginModel data);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, User>> loginWithFacebook();
  Future<Either<Failure, User>> loginWithGoogle();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, User>> checkAuthToken(String auth);
  Future<Either<Failure, Map<String, dynamic>>> addAddress(
      int id, Map<String, dynamic> address);
  Future<Either<Failure, Map<String, dynamic>>> removeAddress(
      int id, String key);
  
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Dio dio;

  AuthRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<Either<Failure, User>> checkAuthToken(String auth) async {
    try {
      final response = await dio.post(
        AppConstants.checkTokenPathUrl,
        data: {'auth': auth},
      );
      if (response.data['error'] == null) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, User>> register(RegisterModel registerModel) async {
    try {
      final response = await dio.post(AppConstants.registerPathUrl,
          data: registerModel.toJson(), options: Options());
      if (response.data['error'] == null) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, User>> login(LoginModel loginModel) async {
    try {
      final response = await dio.post(
        AppConstants.loginPathUrl,
        data: loginModel.toJson(),
      );
      if (response.data['error'] == null) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    try {
      final response =
          await dio.get(AppConstants.forgetPassPathUrl, queryParameters: {
        'email': email,
      });
      if (response.data['error'] == null) {
        return Right(AppStrings.emailSent);
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // you are logged
      // ignore: unused_local_variable
      final AccessToken accessToken = result.accessToken!;
      final userData = await FacebookAuth.instance.getUserData();
      final response = await dio.post(
        AppConstants.loginWithPathUrl,
        data: {
          'name': userData['name'],
          'email': userData['email'],
        },
      );
      if (response.data['error'] == null) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } else {
      if (kDebugMode) {
        print(result.message);
      }
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithGoogle() async {
    try {
      final userData = await GoogleSignIn().signIn();
      final response = await dio.post(
        AppConstants.loginWithPathUrl,
        data: {
          'name': userData!.displayName,
          'email': userData.email,
        },
      );
      if (response.data['error'] == null) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (error) {
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      final result = await GoogleSignIn().signOut();
      result!.clearAuthCache();
      await FacebookAuth.instance.logOut();
      return const Right(unit);
    } catch (error) {
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addAddress(
      int id, Map<String, dynamic> address) async {
    try {
      final response = await dio.post(
        AppConstants.addAddressPathUrl,
        data: {
          'id': id,
          'address': address,
        },
      );
      if (response.statusCode == 200) {
        return Right(response.data['new']);
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> removeAddress(
      int id, String key) async {
    try {
      final response =
          await dio.get(AppConstants.removeAddressPathUrl, queryParameters: {
        'id': id,
        'addressKey': key,
      });
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

 
}
