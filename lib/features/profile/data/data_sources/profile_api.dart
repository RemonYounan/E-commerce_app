// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';

import 'package:ecommerce_app/core/error/failures.dart';
import 'package:flutter/foundation.dart';

abstract class PrfoileApi {
  Future<Either<Failure, Map<String, dynamic>>> getStates(String key);
}

class ProfileApiImpl implements PrfoileApi {
  final Dio dio;

  const ProfileApiImpl({
    required this.dio,
  });

  @override
  Future<Either<Failure, Map<String, dynamic>>> getStates(String key) async {
    try {
      final response =
          await dio.get(AppConstants.getStatePathUrl, queryParameters: {
        'cc': key,
      });
      if (response.data != false) {
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
