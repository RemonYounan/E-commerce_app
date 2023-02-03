import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class PromocodesScreen extends StatelessWidget {
  const PromocodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.promocodes),
      ),
    );
  }
}
