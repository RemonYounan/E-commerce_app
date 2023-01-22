import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/shipping_addres_screen/address_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressesListWidget extends StatelessWidget {
  AddressesListWidget({Key? key}) : super(key: key);
  final List<Widget> addressesWidgets = [];
  @override
  Widget build(BuildContext context) {
    final addresses = BlocProvider.of<AuthCubit>(context).user.addresses;
    addresses.forEach(
      (key, value) {
        print(value);
        addressesWidgets.add(
          AddressCardWidget(
            addressKey: key,
            addressData: value,
          ),
        );
      },
    );
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      children: addressesWidgets,
    );
  }
}
