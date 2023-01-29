import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:flutter/material.dart';

class CardUtils {
  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.visa;
    } else if (input.length <= 8) {
      cardType = CardType.others;
    } else {
      cardType = CardType.invalid;
    }
    return cardType;
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.master:
        img = 'mastercard.png';
        break;
      case CardType.visa:
        img = 'visa.png';
        break;

      case CardType.others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/$img',
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }
}
