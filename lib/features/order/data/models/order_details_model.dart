import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/features/order/data/models/order_product_model.dart';
import 'package:ecommerce_app/features/order/domain/entities/order_details.dart';
import 'package:ecommerce_app/features/order/domain/entities/order_product.dart';
import 'package:ecommerce_app/features/profile/data/models/address_model.dart';

class OrderDetailsModel extends OrderDetails {
  const OrderDetailsModel({
    required super.id,
    required super.status,
    required super.dateCreated,
    required super.discountTotal,
    required super.discountTax,
    required super.shippingTotal,
    required super.shippingTax,
    required super.total,
    required super.totalTax,
    required super.orderKey,
    required super.address,
    required super.paymentMethod,
    required super.products,
    required super.allTotal,
  });

  factory OrderDetailsModel.fromjson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'] as int,
      status: OrderStatus.values.byName(json['status']),
      dateCreated: DateTime.parse(json['date_created']['date']),
      discountTotal: double.parse(json['discount_total']),
      discountTax: double.parse(json['discount_tax']),
      shippingTotal: double.parse(json['shipping_total']),
      shippingTax: double.parse(json['shipping_tax']),
      total: double.parse(json['total'].toString()),
      totalTax: double.parse(json['total_tax']),
      orderKey: json['order_key'] as String,
      address: AddressModel.fromJson(json['billing'] as Map<String, dynamic>),
      paymentMethod: json['payment_method'] as String,
      products: List<OrderProduct>.from(
        (json['products']).map(
          (x) => OrderProductModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
      allTotal: double.parse(json['allTotal']),
    );
  }

  // factory OrderDetailsModel.fromJson(String source) =>
  //     OrderDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
