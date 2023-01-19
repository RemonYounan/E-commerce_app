import '../../../../../core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOrRemoveButton extends StatelessWidget {
  const AddOrRemoveButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 38.r,
        width: 38.r,
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.dark
                : AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: isDark ? 12 : 8,
                color: isDark
                    ? AppColors.shadowColorDark.withOpacity(.6)
                    : AppColors.shadowColor,
              ),
            ]),
        child: Icon(
          icon,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.greyDark
              : AppColors.grey,
          size: 20.r,
        ),
      ),
    );
  }
}
