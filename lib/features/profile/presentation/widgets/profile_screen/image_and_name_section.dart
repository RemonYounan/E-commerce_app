import 'package:ecommerce_app/core/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccessState) {
          return Row(
            children: [
              FaIcon(
                FontAwesomeIcons.circleUser,
                size: 40.r,
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.user.name,
                    style: AppTextStyle.headlineTextStyle3(context),
                  ),
                  Text(
                    state.user.email,
                    style:
                        AppTextStyle.titleMediumTextStyle(context).copyWith(color: AppColors.grey),
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
                  style: AppTextStyle.headlineTextStyle3(context),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
