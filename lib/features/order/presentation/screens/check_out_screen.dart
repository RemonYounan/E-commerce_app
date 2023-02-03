import 'package:ecommerce_app/features/profile/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/custom_text_button.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/check_out_screen/check_out_payment_card.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/check_out_screen/default_address_widget.dart';

import '../widgets/check_out_screen/check_out_summary_widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.checkOut),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.shippingAddresses,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20.h),
              const DefaultAddressWidget(),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    AppStrings.payment,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.payments),
                    title: AppStrings.change,
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
              SizedBox(height: 5.h),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state.cards.isNotEmpty) {
                    return RadioListTile(
                      value: 'CreditCard',
                      title: const CheckOutPaymentCard(),
                      groupValue: 'cod',
                      onChanged: (value) {},
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              RadioListTile(
                value: 'cod',
                title: Text(AppStrings.cashOnDelivery),
                groupValue: 'cod',
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const CheckOutSummaryWidget(),
    );
  }
}
