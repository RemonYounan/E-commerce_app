import 'package:ecommerce_app/features/order/domain/entities/order_product.dart';

class OrderProductModel extends OrderProduct {
  const OrderProductModel({
    required super.id,
    required super.orderId,
    required super.productId,
    required super.name,
    required super.count,
    required super.subTotal,
    required super.subTotalTax,
    required super.total,
    required super.totalTax,
    required super.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'orderId': orderId,
      'productId': productId,
      'name': name,
      'count': count,
      'subTotal': subTotal,
      'subTotalTax': subTotalTax,
      'total': total,
      'totalTax': totalTax,
      'img': img,
    };
  }

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      name: json['name'],
      count: json['quantity'],
      subTotal: double.parse(json['subtotal']),
      subTotalTax: double.parse(json['subtotal_tax']),
      total: double.parse(json['total']),
      totalTax: double.parse(json['total_tax']),
      img: json['productImg'],
    );
  }
}
