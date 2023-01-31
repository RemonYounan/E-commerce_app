import 'package:ecommerce_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/order/data/data_source/order_remote_data_source.dart';
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
}
