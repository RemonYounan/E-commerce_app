import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/order/domain/entities/shipping_cost.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/features/order/domain/usecases/get_shipping_cost_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this.getShippingCostUsecase,
  ) : super(const OrderState());

  final GetShippingCostUsecase getShippingCostUsecase;

  Future<void> getShippingCost(String country, String city) async {
    final result = await getShippingCostUsecase(country, city);
    result.fold(
        (error) => emit(
              OrderState(status: OrderStatus.error, message: error.message),
            ), (cost) {
      emit(OrderState(status: OrderStatus.loaded, shippingCost: cost));
    });
  }
}
