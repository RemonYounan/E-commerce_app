import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/empty_state_widget.dart';
import 'package:flutter/material.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      imgPath: AppAssets.emptyBag,
      title: AppStrings.bagEmptyTitle,
      discription: AppStrings.bagEmptyDiscription,
    );
  }
}
