import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/order/domain/entities/order.dart';
import 'package:ecommerce_app/features/order/domain/repositories/order_repository.dart';

class GetOrdersUsecase {
  final OrderRepository orderRepository;

  GetOrdersUsecase(this.orderRepository);

  Future<Either<Failure, List<OrderItem>>> call(int id) async {
    return await orderRepository.getOrders(id);
  }
}
