import 'package:equatable/equatable.dart';

class CreateOrderRequest extends Equatable {
  final int id;
  final Map<String, dynamic> address;
  final double shippingCost;
  final String selectedMethod;
  final List<Map<String, dynamic>> products;

  const CreateOrderRequest({
    required this.id,
    required this.address,
    required this.shippingCost,
    required this.selectedMethod,
    required this.products,
  });

  @override
  List<Object> get props {
    return [id, address, shippingCost, selectedMethod, products];
  }
}
