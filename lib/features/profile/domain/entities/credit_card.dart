import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:equatable/equatable.dart';

class CreditCard extends Equatable {
  final String name;
  final int cardNumber;
  final CardType type;
  final String expiryDate;
  final int cvv;

  const CreditCard({
    required this.name,
    required this.cardNumber,
    required this.type,
    required this.expiryDate,
    required this.cvv,
  });

  @override
  List<Object> get props => [name, cardNumber, type, expiryDate, cvv];
}
