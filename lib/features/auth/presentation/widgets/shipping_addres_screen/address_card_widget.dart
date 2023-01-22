import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCardWidget extends StatelessWidget {
  const AddressCardWidget({
    Key? key,
    required this.addressKey,
    required this.addressData,
  }) : super(key: key);

  final String addressKey;
  final Map<String, dynamic> addressData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        // BlocProvider.of<AuthCubit>(context).removeAddress(addressKey);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${addressData.values.first} ${addressData.values.elementAt(1)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.addShippingAddress,
                        arguments: addressData,
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      alignment: Alignment.center,
                      textStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    child: const Text('Edit'),
                  ),
                ],
              ),
              ...List.generate(
                addressData.length - 2,
                (i) => Text(
                  '${addressData.values.elementAt(i + 2)}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
