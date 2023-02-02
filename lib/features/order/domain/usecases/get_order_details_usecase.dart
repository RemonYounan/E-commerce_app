import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/order/domain/entities/order_details.dart';
import 'package:ecommerce_app/features/order/domain/repositories/order_repository.dart';

class GetOrderDetailsUsecase {
  final OrderRepository orderRepository;

  GetOrderDetailsUsecase(this.orderRepository);

  Future<Either<Failure, OrderDetails>> call(int id) async {
    return await orderRepository.getOrder(id);
  }
}
