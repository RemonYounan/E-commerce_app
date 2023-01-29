import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/app_routes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../auth/presentation/blocs/auth/auth_cubit.dart';

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
                  AppStrings.signUp,
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
