import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/constants/app_strings.dart';
import '../widgets/forgot_password_screen/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
              child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                      childAnimationBuilder: (child) => ScaleAnimation(
                          delay: const Duration(milliseconds: 50),
                          child: FadeInAnimation(
                            child: child,
                          )),
                      children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.forgotPassword,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(height: 70.h),
                    Text(
                      AppStrings.forgotPasswordHelp,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 18.h),
                    const ForgotPasswordForm(),
                  ])),
            ),
          ),
        ),
      ),
    );
  }
}
