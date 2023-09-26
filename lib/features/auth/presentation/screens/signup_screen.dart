import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/common/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../widgets/signup_screen/sign_with_widget.dart';
import '../widgets/signup_screen/signup_form.dart';

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
            child: SingleChildScrollView(
              child: AnimationLimiter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                  child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                          childAnimationBuilder: (child) => ScaleAnimation(
                                duration: const Duration(milliseconds: 500),
                                delay: const Duration(milliseconds: 50),
                                child: FadeInAnimation(
                                  child: child,
                                ),
                              ),
                          children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.signUp,
                            style: AppTextStyle.headlineTextStyle1(context),
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
                      ])),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
