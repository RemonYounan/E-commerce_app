import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/signup_screen/sign_with_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignWithWidget extends StatelessWidget {
  const SignWithWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignWithIcon(
              path: AppAssets.googleIcon,
              onTap: () {
                BlocProvider.of<AuthCubit>(context).loginWithGoogle();
              },
            ),
            SizedBox(width: 15.w),
            SignWithIcon(
              path: AppAssets.facebookIcon,
              onTap: () {
                BlocProvider.of<AuthCubit>(context).loginWithFacebook();
              },
            ),
          ],
        )
      ],
    );
  }
}
