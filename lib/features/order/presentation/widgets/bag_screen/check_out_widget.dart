import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../blocs/cart/cart_cubit.dart';

class CheckOutWidget extends StatefulWidget {
  const CheckOutWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckOutWidget> createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {
  late TextEditingController _promoController;

  @override
  void initState() {
    super.initState();
    _promoController = TextEditingController();
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
        height: 200.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 40.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      hintText: AppStrings.enterPromoCode,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                            color: isDark ? AppColors.greyDark : AppColors.grey,
                          ),
                    ),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: isDark ? AppColors.whiteDark : AppColors.black,
                        ),
                  ),
                  Positioned(
                    top: -5,
                    right: -10,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      splashRadius: 10,
                      icon: Icon(
                        Icons.arrow_circle_right_rounded,
                        color:
                            isDark ? AppColors.greyDark : AppColors.lightBlack,
                        size: 50.r,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  AppStrings.totalAmount,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.greyDark),
                ),
                const Spacer(),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      '${state.cart.totalAmount.toInt()}\$',
                      style: Theme.of(context).textTheme.headlineSmall,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(
              child: Text(AppStrings.checkOut.toUpperCase()),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.checkOut);
              },
            ),
          ],
        ));
  }
}
