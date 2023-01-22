import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class OrderRemoteDataSource {}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  Dio dio;

  OrderRemoteDataSourceImpl({
    required this.dio,
  });
}
