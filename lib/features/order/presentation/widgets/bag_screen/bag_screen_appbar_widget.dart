import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
