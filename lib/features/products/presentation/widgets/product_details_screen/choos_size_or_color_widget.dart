import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/app_text_styles.dart';
import '../../../../../core/constants/app_strings.dart';

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
            constraints: BoxConstraints(
                minWidth: double.infinity,
                maxHeight: (max(items.length * 120, 150)).h),
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Column(
                children: [
                  Text(
                    '${AppStrings.select} ${name.toLowerCase()}',
                    style: AppTextStyle.headlineTextStyle3(context),
                  ),
                  SizedBox(height: 20.h),
                  if (items.isEmpty) Text('No $name available'),
                  ...List.generate(
                    items.length,
                    (index) {
                      return ListTile(
                        onTap: () {},
                        title: Text(
                          items[index],
                          style: AppTextStyle.headlineTextStyle3(context),
                        ),
                      );
                    },
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
              style: AppTextStyle.titleNormalTextStyle2(context),
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
