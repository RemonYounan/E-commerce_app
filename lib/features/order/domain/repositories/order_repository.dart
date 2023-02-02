import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/order/domain/entities/create_order_request.dart';
import 'package:ecommerce_app/features/order/domain/entities/order.dart';
import 'package:ecommerce_app/features/order/domain/entities/order_details.dart';
import 'package:ecommerce_app/features/order/domain/entities/shipping_cost.dart';

abstract class OrderRepository {
  Future<Either<Failure, ShippingCost>> getShippingCost(
      String country, String city);
  Future<Either<Failure, int>> createOrder(CreateOrderRequest orderRequest);
  Future<Either<Failure, List<OrderItem>>> getOrders(int id);
  Future<Either<Failure, OrderDetails>> getOrder(int id);
}
