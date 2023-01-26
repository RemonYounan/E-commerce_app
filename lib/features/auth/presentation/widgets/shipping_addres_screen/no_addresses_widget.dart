import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoAddressesWidget extends StatelessWidget {
  const NoAddressesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noAddresses,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
