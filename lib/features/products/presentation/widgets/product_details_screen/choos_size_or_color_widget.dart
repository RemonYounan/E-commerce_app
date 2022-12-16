import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app_colors.dart';

class ChooseSizeOrColorWidget extends StatelessWidget {
  const ChooseSizeOrColorWidget({
    Key? key,
    required this.name,
    required this.items,
  }) : super(key: key);

  final String name;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Column(
                children: [
                  Text(
                    'select_${name.toLowerCase()}'.tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
            ),
          );
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.greyDark
                : AppColors.grey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.greyDark
                  : AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
