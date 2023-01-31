import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/order/domain/entities/shipping_cost.dart';
import 'package:ecommerce_app/features/order/domain/repositories/order_repository.dart';

class GetShippingCostUsecase {
  final OrderRepository orderRepository;

  const GetShippingCostUsecase(this.orderRepository);

  Future<Either<Failure, ShippingCost>> call(
      String country, String city) async {
    return await orderRepository.getShippingCost(country, city);
  }
}
