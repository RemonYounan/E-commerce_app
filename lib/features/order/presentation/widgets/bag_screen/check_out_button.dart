import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/app_routes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../../auth/presentation/blocs/auth/auth_cubit.dart';
import '../../blocs/order/order_cubit.dart';
import '../../screens/check_out_screen.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      middleColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      openBuilder: (context, action) => const CheckOutScreen(),
      closedBuilder: (context, action) => CustomButton(
        onPressed: () {
          final hasAddress = BlocProvider.of<AuthCubit>(context).hasAddress();
          if (hasAddress) {
            final address =
                BlocProvider.of<AuthCubit>(context).getDefaultAddress();
            if (address.isNotEmpty) {
              BlocProvider.of<OrderCubit>(context).getShippingCost(
                address['billing_country'],
                address['billing_country'],
              );
            }
            action();
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(AppStrings.noSavedAddresses),
                content: Text(AppStrings.noSavedAddressesContent),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(AppStrings.no)),
                  TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, AppRoutes.addShippingAddress),
                      child: Text(AppStrings.yes)),
                ],
              ),
            );
          }
        },
        child: Text(AppStrings.checkOut.toUpperCase()),
      ),
    );
  }
}
