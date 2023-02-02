import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/features/order/domain/entities/order_product.dart';
import 'package:ecommerce_app/features/profile/domain/entities/address.dart';

class OrderDetails extends Equatable {
  final int id;
  final OrderStatus status;
  final DateTime dateCreated;
  final double discountTotal;
  final double discountTax;
  final double shippingTotal;
  final double shippingTax;
  final double total;
  final double totalTax;
  final String orderKey;
  final Address address;
  final String paymentMethod;
  final List<OrderProduct> products;
  final double allTotal;
  
  const OrderDetails({
    required this.id,
    required this.status,
    required this.dateCreated,
    required this.discountTotal,
    required this.discountTax,
    required this.shippingTotal,
    required this.shippingTax,
    required this.total,
    required this.totalTax,
    required this.orderKey,
    required this.address,
    required this.paymentMethod,
    required this.products,
    required this.allTotal,
  });

  @override
  List<Object> get props {
    return [
      id,
      status,
      dateCreated,
      discountTotal,
      discountTax,
      shippingTotal,
      shippingTax,
      total,
      totalTax,
      orderKey,
      address,
      paymentMethod,
      products,
      allTotal,
    ];
  }
}
