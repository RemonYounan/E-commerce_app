import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/features/auth/presentation/widgets/login_screen/login_form.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/signup_screen/sign_with_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'login'.tr(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              const LoginForm(),
              SizedBox(
                height: 130.h,
              ),
              SignWithWidget(
                title: 'or_login_with'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
