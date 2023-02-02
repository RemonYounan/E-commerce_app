import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/features/order/domain/entities/order.dart';

class OrderModel extends OrderItem {
  const OrderModel({
    required super.id,
    required super.status,
    required super.dateCreated,
    required super.img,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        status: OrderStatus.values.byName(json['status']),
        dateCreated: json['created'],
        img: json['productImg'],
      );
}
