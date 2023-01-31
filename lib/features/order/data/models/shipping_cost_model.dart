import 'package:ecommerce_app/features/order/domain/entities/shipping_cost.dart';

class ShippingCostModel extends ShippingCost {
  const ShippingCostModel({
    required super.id,
    required super.cost,
  });

  factory ShippingCostModel.fromJson(Map<String, dynamic> json) =>
      ShippingCostModel(
        id: json['id'],
        cost: double.tryParse(json['cost']) ?? 0,
      );
}
