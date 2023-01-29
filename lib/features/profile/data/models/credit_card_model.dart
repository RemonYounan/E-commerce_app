import 'package:ecommerce_app/features/profile/domain/entities/credit_card.dart';

class CreditCardModel extends CreditCard {
  const CreditCardModel({
    required super.name,
    required super.cardNumber,
    required super.expiryDate,
    required super.cvv,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      CreditCardModel(
        name: json['name'],
        cardNumber: json['cardNumber'],
        expiryDate: json['expiryDate'],
        cvv: json['cvv'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'cardNumber': cardNumber,
        'expiryDate': expiryDate,
        'cvv': cvv,
      };
}
