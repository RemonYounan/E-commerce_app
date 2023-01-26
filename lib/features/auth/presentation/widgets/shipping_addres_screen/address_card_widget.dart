import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/custom_text_button.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCardWidget extends StatelessWidget {
  const AddressCardWidget({
    Key? key,
    required this.addressKey,
    required this.addressData,
    this.title,
    this.onPressed,
    this.chooseDefault = false,
  }) : super(key: key);

  final String addressKey;
  final Map<String, dynamic> addressData;
  final String? title;
  final VoidCallback? onPressed;
  final bool chooseDefault;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${addressData['billing_first_name']} ${addressData['billing_last_name']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CustomTextButton(
                    onPressed: onPressed ??
                        () => Navigator.pushNamed(
                              context,
                              AppRoutes.addShippingAddress,
                              arguments: addressData,
                            ),
                    title: title ?? AppStrings.edit)
              ],
            ),
            Text(
              addressData['billing_address_1'],
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 5.h),
            Text(
              '${addressData['billing_city']}, ${addressData['billing_state']}, ${addressData['billing_postcode']}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 5.h),
            Text(
              addressData['billing_phone'],
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 5.h),
            Text(
              addressData['billing_email'],
              style: Theme.of(context).textTheme.titleSmall,
            ),
            if (chooseDefault)
              Row(
                children: [
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return Checkbox(
                        value: BlocProvider.of<AuthCubit>(context)
                                .user
                                .defaultAddresse ==
                            addressKey,
                        onChanged: (_) => BlocProvider.of<AuthCubit>(context)
                            .changeDefaultAddress(addressKey),
                      );
                    },
                  ),
                  Text(
                    AppStrings.useAsShippingAddress,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
