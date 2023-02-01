import 'package:ecommerce_app/features/order/domain/entities/create_order_request.dart';

class CreateOrderRequestModel extends CreateOrderRequest {
  const CreateOrderRequestModel({
    required super.id,
    required super.address,
    required super.shippingCost,
    required super.selectedMethod,
    required super.products,
  });

  Map<String, dynamic> toJson() => {
        'userID': id,
        'address': address,
        'shippingCost': shippingCost,
        'selectedMethod': selectedMethod,
        'products': products,
      };
}
