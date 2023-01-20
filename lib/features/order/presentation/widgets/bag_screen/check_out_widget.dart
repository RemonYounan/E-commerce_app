import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../../../core/utils/custom_text_field_widget.dart';
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
    return Container(
        height: 200.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextFieldWidget(
              label: AppStrings.enterPromoCode,
              controller: _promoController,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
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
              onPressed: () {},
            ),
          ],
        ));
  }
}
