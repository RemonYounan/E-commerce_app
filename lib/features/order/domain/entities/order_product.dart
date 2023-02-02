import 'package:equatable/equatable.dart';

class OrderProduct extends Equatable {
  final int id;
  final int orderId;
  final int productId;
  final String name;
  final int count;
  final double subTotal;
  final double subTotalTax;
  final double total;
  final double totalTax;
  final String img;

  const OrderProduct({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.name,
    required this.count,
    required this.subTotal,
    required this.subTotalTax,
    required this.total,
    required this.totalTax,
    required this.img,
  });

  @override
  List<Object> get props {
    return [
      id,
      orderId,
      productId,
      name,
      count,
      subTotal,
      subTotalTax,
      total,
      totalTax,
      img,
    ];
  }
}
