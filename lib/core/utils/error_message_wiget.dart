import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../common/app_text_styles.dart';

class ErrorMessageWiget extends StatelessWidget {
  const ErrorMessageWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.errorOccured,
        style: AppTextStyle.subheadTextStyle(context),
      ),
    );
  }
}
