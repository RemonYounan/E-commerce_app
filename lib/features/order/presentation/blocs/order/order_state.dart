part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class InitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class ShippingCostLoaded extends OrderState {}

class OrderLoadedState extends OrderState {
  final List<OrderItem> completedOrders;
  final List<OrderItem> pendingOrders;
  final List<OrderItem> cancelledOrders;
  final List<OrderDetails> ordersDetails;

  const OrderLoadedState({
    this.completedOrders = const [],
    this.pendingOrders = const [],
    this.cancelledOrders = const [],
    this.ordersDetails = const [],
  });

  OrderLoadedState copyWith({
    List<OrderItem>? completedOrders,
    List<OrderItem>? pendingOrders,
    List<OrderItem>? cancelledOrders,
    List<OrderDetails>? ordersDetails,
  }) =>
      OrderLoadedState(
        completedOrders: completedOrders ?? this.completedOrders,
        pendingOrders: pendingOrders ?? this.pendingOrders,
        cancelledOrders: cancelledOrders ?? this.cancelledOrders,
        ordersDetails: ordersDetails ?? this.ordersDetails,
      );

  @override
  List<Object> get props =>
      [completedOrders, pendingOrders, cancelledOrders, ordersDetails];
}

class OrderPlacedState extends OrderState {}

class OrderErrorState extends OrderState {
  final String message;

  const OrderErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
