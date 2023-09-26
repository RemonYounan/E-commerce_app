// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/order/data/models/create_order_request_model.dart';
import 'package:ecommerce_app/features/order/data/models/order_details_model.dart';
import 'package:ecommerce_app/features/order/data/models/order_model.dart';
import 'package:ecommerce_app/features/order/data/models/shipping_cost_model.dart';
import 'package:ecommerce_app/features/order/domain/entities/order.dart';
import 'package:ecommerce_app/features/order/domain/entities/order_details.dart';
import 'package:ecommerce_app/features/order/domain/entities/shipping_cost.dart';

abstract class OrderRemoteDataSource {
  Future<Either<Failure, ShippingCost>> getShippingCost(
      String country, String city);
  Future<Either<Failure, int>> createOrder(
      CreateOrderRequestModel orderRequest);
  Future<Either<Failure, List<OrderItem>>> getOrders(int id);
  Future<Either<Failure, OrderDetails>> getOrder(int id);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  Dio dio;

  OrderRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<Either<Failure, int>> createOrder(
      CreateOrderRequestModel orderRequest) async {
    try {
      final response =
          await dio.post(AppConstants.createOrderPathUrl, data: orderRequest);
      if (response.statusCode == 200) {
        return Right(response.data['id']);
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, ShippingCost>> getShippingCost(
      String country, String city) async {
    try {
      final response =
          await dio.get(AppConstants.getShippingCostPathUrl, queryParameters: {
        'cc': country,
        'city': city,
      });
      if (response.statusCode == 200) {
        final cost =
            ShippingCostModel.fromJson((response.data as Map).values.first);
        return Right(cost);
      } else {
        return Left(ServerFailure(message: AppStrings.errorOccured));
      }
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: AppStrings.errorOccured));
    }
  }

  @override
  Future<Either<Failure, List<OrderItem>>> getOrders(int id) async {
    try {
      final response = await dio
          .get(AppConstants.getOrdersPathUrl, queryParameters: {'id': id});
      if (response.statusCode == 200) {
        final List<OrderModel> orders =
            List.from(response.data.map((order) => OrderModel.fromJson(order)));
        return Right(orders);
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderDetails>> getOrder(int id) async {
    try {
      final response = await dio
          .get(AppConstants.getOrderPathUrl, queryParameters: {'id': id});
      if (response.statusCode == 200) {
        final orderDetails = OrderDetailsModel.fromjson(response.data);
        return Right(orderDetails);
      } else {
        return Left(ServerFailure(message: response.data['error']));
      }
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
