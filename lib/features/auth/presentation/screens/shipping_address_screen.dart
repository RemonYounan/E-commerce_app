import 'package:ecommerce_app/features/auth/presentation/widgets/shipping_addres_screen/addresses_list_widget.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.shippingAddresses),
      ),
      body: AddressesListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AppRoutes.addShippingAddress),
        child: const Icon(Icons.add),
      ),
    );
  }
}
