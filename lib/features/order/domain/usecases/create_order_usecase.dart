import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/order/domain/entities/create_order_request.dart';
import 'package:ecommerce_app/features/order/domain/repositories/order_repository.dart';

import '../../../../core/error/failures.dart';

class CreateOrderUsecase {
  final OrderRepository orderRepository;

  const CreateOrderUsecase(this.orderRepository);

  Future<Either<Failure, int>> call(CreateOrderRequest orderRequest) async {
    return await orderRepository.createOrder(orderRequest);
  }
}
