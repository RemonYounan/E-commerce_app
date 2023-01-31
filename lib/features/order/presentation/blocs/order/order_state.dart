part of 'order_cubit.dart';

enum OrderStatus { loading, loaded, error }

class OrderState extends Equatable {
  final OrderStatus status;
  final ShippingCost? shippingCost;
  final String message;

  const OrderState({
    this.status = OrderStatus.loading,
    this.shippingCost,
    this.message = '',
  });

  @override
  List<Object> get props => [status, message];
}
