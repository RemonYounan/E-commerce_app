import 'package:ecommerce_app/features/profile/presentation/widgets/payment_methods_screen/add_payment_widget.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/payment_methods_screen/payment_methods_list.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppStrings.paymentMethods),
      ),
      body: const PaymentMethodsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const AddPaymentWidget(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
