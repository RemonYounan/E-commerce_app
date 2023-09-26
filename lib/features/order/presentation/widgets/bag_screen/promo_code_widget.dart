import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/app_text_styles.dart';
import '../../../../../core/constants/app_strings.dart';

class PromoCodeWidget extends StatefulWidget {
  const PromoCodeWidget({
    super.key,
  });

  @override
  State<PromoCodeWidget> createState() => _PromoCodeWidgetState();
}

class _PromoCodeWidgetState extends State<PromoCodeWidget> {
  final _formKey = GlobalKey<FormState>();
  int height = 40;
  double top = 5;
  void checkPromoCode() {
    if (_formKey.currentState!.validate()) {
    } else {
      setState(() {
        height = 60;
        top = 8;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: height.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                hintText: AppStrings.enterPromoCode,
                hintStyle: AppTextStyle.titleMediumTextStyle(context).copyWith(
                  color: isDark ? AppColors.greyDark : AppColors.grey,
                ),
              ),
              validator: (value) {
                return AppStrings.promoCodeError;
              },
              style: AppTextStyle.titleMediumTextStyle(context).copyWith(
                color: isDark ? AppColors.whiteDark : AppColors.black,
              ),
            ),
          ),
          Positioned(
            top: -top,
            right: -10,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: checkPromoCode,
              splashRadius: 10,
              icon: Icon(
                Icons.arrow_circle_right_rounded,
                color: isDark ? AppColors.greyDark : AppColors.lightBlack,
                size: 50.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
