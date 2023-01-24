import 'package:animations/animations.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/add_shipping_address_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/shipping_addres_screen/addresses_list_widget.dart';
import 'package:flutter/material.dart';

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
      floatingActionButton: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedColor: Colors.transparent,
        openColor: Colors.transparent,
        transitionDuration: const Duration(milliseconds: 500),
        closedBuilder: (context, action) => FloatingActionButton(
          onPressed: action,
          
          child: const Icon(Icons.add),
        ),
        openBuilder: (context, action) => const AddShippingAddressScreen(),
      ),
    );
  }
}
