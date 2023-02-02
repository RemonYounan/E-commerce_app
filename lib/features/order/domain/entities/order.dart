import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/core/constants/enums.dart';

class OrderItem extends Equatable {
  const OrderItem({
    required this.id,
    required this.status,
    required this.dateCreated,
    required this.img,
  });

  final String dateCreated;
  final int id;
  final String img;
  final OrderStatus status;

  @override
  List<Object> get props => [id, status, dateCreated, img];
}
