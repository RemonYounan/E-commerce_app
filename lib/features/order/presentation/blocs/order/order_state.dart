part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class InitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {}

class OrderPlacedState extends OrderState {}

class OrderErrorState extends OrderState {
  final String message;

  const OrderErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
