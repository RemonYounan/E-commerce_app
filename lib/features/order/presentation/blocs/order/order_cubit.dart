import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/order/domain/entities/create_order_request.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/features/order/domain/entities/shipping_cost.dart';
import 'package:ecommerce_app/features/order/domain/usecases/create_order_usecase.dart';
import 'package:ecommerce_app/features/order/domain/usecases/get_shipping_cost_usecase.dart';

import '../../../domain/entities/cart_product.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this.getShippingCostUsecase,
    this.createOrderUsecase,
  ) : super(InitialState());

  final GetShippingCostUsecase getShippingCostUsecase;
  final CreateOrderUsecase createOrderUsecase;

  ShippingCost _shippingCost = const ShippingCost();

  ShippingCost get shippingCost => _shippingCost;

  Future<void> getShippingCost(String country, String city) async {
    if (_shippingCost.cost == 0) {
      emit(OrderLoadingState());
      final result = await getShippingCostUsecase(country, city);
      result.fold(
          (error) => emit(
                OrderErrorState(message: error.message),
              ), (cost) {
        _shippingCost = cost;
        emit(OrderLoadedState());
      });
    }
  }

  Future<void> createorder(int id, Map<String, dynamic> address,
      List<CartProduct> cartProducts) async {
    emit(OrderLoadingState());
    final List<Map<String, dynamic>> products =
        cartProducts.map((e) => {'id': e.id, 'count': e.count}).toList();
    final orderRequest = CreateOrderRequest(
        id: id,
        address: address,
        shippingCost: _shippingCost.cost,
        selectedMethod: 'cod',
        products: products);
    final result = await createOrderUsecase(orderRequest);
    result.fold((error) => emit(OrderErrorState(message: error.message)),
        (_) => emit(OrderPlacedState()));
  }
}
