import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class NoMoreItemsWidget extends StatelessWidget {
  const NoMoreItemsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      AppStrings.noMoreItems,
      style: Theme.of(context).textTheme.titleSmall,
    ));
  }
}
