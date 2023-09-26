import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_text_styles.dart';

class BagScreenAppbarWidget extends StatelessWidget {
  const BagScreenAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 100.h,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.05,
        titlePadding: EdgeInsets.only(left: 14.w, bottom: 5.h),
        title: Text(
          AppStrings.myBag,
          style: AppTextStyle.headlineTextStyle1(context),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          ),
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
