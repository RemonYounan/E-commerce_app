// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/order/domain/entities/order_details.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/features/order/domain/entities/create_order_request.dart';
import 'package:ecommerce_app/features/order/domain/entities/order.dart';
import 'package:ecommerce_app/features/order/domain/entities/shipping_cost.dart';
import 'package:ecommerce_app/features/order/domain/usecases/create_order_usecase.dart';
import 'package:ecommerce_app/features/order/domain/usecases/get_order_details_usecase.dart';
import 'package:ecommerce_app/features/order/domain/usecases/get_orders_usecase.dart';
import 'package:ecommerce_app/features/order/domain/usecases/get_shipping_cost_usecase.dart';

import '../../../domain/entities/cart_product.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this.getShippingCostUsecase,
    this.createOrderUsecase,
    this.getOrdersUsecase,
    this.getOrderDetailsUsecase,
  ) : super(InitialState());

  final GetShippingCostUsecase getShippingCostUsecase;
  final CreateOrderUsecase createOrderUsecase;
  final GetOrdersUsecase getOrdersUsecase;
  final GetOrderDetailsUsecase getOrderDetailsUsecase;
  late OrderLoadedState _state;

  final List<OrderDetails> _ordersDetails = [];

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
        emit(ShippingCostLoaded());
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

  Future<void> getOrders(int id) async {
    if (state is! OrderLoadedState) {
      emit(OrderLoadingState());
      final result = await getOrdersUsecase(id);
      result.fold((error) => emit(OrderErrorState(message: error.message)),
          (orders) {
        final completedOrders = orders
            .where(
              (element) => element.status == OrderStatus.completed,
            )
            .toList();
        final pendingOrders = orders
            .where(
              (element) => element.status == OrderStatus.pending,
            )
            .toList();
        final cancelledOrders = orders
            .where(
              (element) => element.status == OrderStatus.cancelled,
            )
            .toList();
        _state = OrderLoadedState(
            completedOrders: completedOrders,
            cancelledOrders: cancelledOrders,
            pendingOrders: pendingOrders);
        emit(_state);
      });
    }
  }

  void refreshOrders(int id) {
    emit(OrderLoadingState());
    getOrders(id);
  }

  Future<void> getOrderDetails(int id) async {
    if (_state.ordersDetails.where((element) => element.id == id).isEmpty) {
      emit(OrderLoadingState());
      final result = await getOrderDetailsUsecase(id);
      result.fold((error) => emit(OrderErrorState(message: error.message)),
          (order) {
        _ordersDetails.add(order);
        _state = _state.copyWith(ordersDetails: _ordersDetails);
        emit(_state);
      });
    }
  }
}
