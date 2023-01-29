import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/auth/auth_cubit.dart';

class SetDefaultCheckBox extends StatelessWidget {
  const SetDefaultCheckBox({
    super.key,
    required this.addressKey,
  });

  final String addressKey;

  @override
  Widget build(BuildContext context) {
    bool isDefault(String key) {
      return BlocProvider.of<AuthCubit>(context).user.defaultAddresse == key;
    }

    return Row(
      children: [
        SizedBox(
          width: 20.w,
          child: Checkbox(
            side: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.greyDark
                  : AppColors.grey,
              width: 2,
            ),
            value: isDefault(addressKey),
            onChanged: (_) {
              if (!isDefault(addressKey)) {
                BlocProvider.of<AuthCubit>(context)
                    .changeDefaultAddress(addressKey);
              }
            },
          ),
        ),
        SizedBox(width: 13.w),
        Text(
          AppStrings.useAsShippingAddress,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
