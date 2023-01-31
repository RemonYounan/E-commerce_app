import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/features/profile/domain/entities/credit_card.dart';

class CreditCardModel extends CreditCard {
  const CreditCardModel({
    required super.name,
    required super.cardNumber,
    required super.type,
    required super.expiryDate,
    required super.cvv,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      CreditCardModel(
        name: json['name'],
        cardNumber: json['cardNumber'],
        type: CardType.values.byName(json['type']),
        expiryDate: json['expiryDate'],
        cvv: json['cvv'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'cardNumber': cardNumber,
        'type': type.name,
        'expiryDate': expiryDate,
        'cvv': cvv,
      };
}
