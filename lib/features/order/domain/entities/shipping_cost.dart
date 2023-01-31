import 'package:equatable/equatable.dart';

class ShippingCost extends Equatable {
  final String id;
  final double cost;

  const ShippingCost({
    required this.id,
    required this.cost,
  });

  @override
  List<Object> get props => [id, cost];
}
