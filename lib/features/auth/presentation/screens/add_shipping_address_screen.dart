// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/shipping_addres_screen/add_shipping_address_form.dart';

class AddShippingAddressScreen extends StatelessWidget {
  const AddShippingAddressScreen({
    Key? key,
    this.address,
  }) : super(key: key);

  final Map<String, dynamic>? address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.addShippingAddress),
        ),
        body: AddShippingAddressForm(address: address),
      ),
    );
  }
}
