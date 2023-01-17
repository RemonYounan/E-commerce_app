import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/signup_screen/sign_with_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/signup_screen/signup_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Form(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.signUp,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                const SignupForm(),
                SizedBox(
                  height: 90.h,
                ),
                SignWithWidget(
                  title: AppStrings.orSignUpWith,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
