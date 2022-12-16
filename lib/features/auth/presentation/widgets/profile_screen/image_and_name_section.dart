import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageAndNameSection extends StatelessWidget {
  const ImageAndNameSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccessState) {
          return Row(
            children: [
              CircleAvatar(
                radius: 32.r,
                backgroundColor: AppColors.primaryColor,
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.user.name,
                    style: textTheme.headlineSmall,
                  ),
                  Text(
                    state.user.email,
                    style:
                        textTheme.titleSmall!.copyWith(color: AppColors.grey),
                  ),
                ],
              )
            ],
          );
        } else {
          return Row(
            children: [
              CircleAvatar(
                radius: 32.r,
                backgroundColor: AppColors.primaryColorDark,
                // backgroundImage: ,
              ),
              SizedBox(width: 20.w),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.signUp),
                child: Text(
                  'sign_up'.tr(),
                  style: textTheme.headlineSmall,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
