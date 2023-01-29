import 'package:equatable/equatable.dart';

class CreditCard extends Equatable {
  final String name;
  final int cardNumber;
  final String expiryDate;
  final int cvv;

  const CreditCard({
    required this.name,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });

  @override
  List<Object> get props => [name, cardNumber, expiryDate, cvv];
}
