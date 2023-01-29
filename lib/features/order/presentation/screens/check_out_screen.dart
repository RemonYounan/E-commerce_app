import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/core/utils/custom_text_button.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/shipping_addres_screen/address_card_widget.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/shipping_addres_screen/no_addresses_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_colors.dart';
import '../blocs/cart/cart_cubit.dart';

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
              Text(
                AppStrings.payment,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 5.h),
              const DefaultAddressWidget(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 230.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  '${AppStrings.order}:',
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
            Row(
              children: [
                Text(
                  '${AppStrings.order}:',
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
            Row(
              children: [
                Text(
                  '${AppStrings.order}:',
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
              child: Text(AppStrings.submitOrder),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultAddressWidget extends StatelessWidget {
  const DefaultAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final address = BlocProvider.of<AuthCubit>(context).user.addresses;
        final defaultAddresse =
            BlocProvider.of<AuthCubit>(context).user.defaultAddresse;
        return address.isNotEmpty
            ? AddressCardWidget(
                addressKey: defaultAddresse,
                addressData: address[defaultAddresse],
                title: AppStrings.change,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.shippingAddresses),
              )
            : SizedBox(
                height: 150.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const NoAddressesWidget(),
                    CustomTextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRoutes.addShippingAddress,
                      ),
                      title: AppStrings.addShippingAddress,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
