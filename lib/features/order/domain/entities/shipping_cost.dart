import 'package:equatable/equatable.dart';

class ShippingCost extends Equatable {
  final String id;
  final double cost;

  const ShippingCost({
    this.id = '',
    this.cost = 0,
  });

  @override
  List<Object> get props => [];
}
