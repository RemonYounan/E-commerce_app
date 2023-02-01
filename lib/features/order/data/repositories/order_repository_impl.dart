import 'package:ecommerce_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/order/data/data_source/order_remote_data_source.dart';
import 'package:ecommerce_app/features/order/data/models/create_order_request_model.dart';
import 'package:ecommerce_app/features/order/domain/entities/create_order_request.dart';
import 'package:ecommerce_app/features/order/domain/entities/shipping_cost.dart';
import 'package:ecommerce_app/features/order/domain/repositories/order_repository.dart';

class OrderRepositoyImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoyImpl(
    this.remoteDataSource,
  );

  @override
  Future<Either<Failure, ShippingCost>> getShippingCost(
      String country, String city) async {
    return await remoteDataSource.getShippingCost(country, city);
  }

  @override
  Future<Either<Failure, int>> createOrder(
      CreateOrderRequest orderRequest) async {
    final orderRequestModel = CreateOrderRequestModel(
        id: orderRequest.id,
        address: orderRequest.address,
        shippingCost: orderRequest.shippingCost,
        selectedMethod: orderRequest.selectedMethod,
        products: orderRequest.products);
    return await remoteDataSource.createOrder(orderRequestModel);
  }
}
