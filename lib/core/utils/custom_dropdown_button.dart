import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    Key? key,
    required this.currentValue,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final String currentValue;
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 8,
              color: AppColors.lightShadowColor,
            ),
          ],
        ),
        child: DropdownButtonFormField(
          style: Theme.of(context).textTheme.labelLarge,
          dropdownColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.dark
              : AppColors.white,
          borderRadius: BorderRadius.circular(6),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h)),
          value: currentValue,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
