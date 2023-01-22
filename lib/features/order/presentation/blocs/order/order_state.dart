// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class AddAddressLoadingState extends OrderState {}

class AddAddressSuccessState extends OrderState {}

class AddAddressErrorState extends OrderState {
  final String message;

  const AddAddressErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

// class OrderInitial extends OrderState {}
