import 'package:animations/animations.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/core/utils/show_error_toast.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/forgot_password_screen.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/app_routes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../blocs/auth/auth_cubit.dart';
import '../../../../../core/utils/custom_text_field_widget.dart';
import '../../../../../core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus!.unfocus();
      BlocProvider.of<AuthCubit>(context).login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFieldWidget(
            label: AppStrings.email,
            controller: _emailController,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.emailError1;
              } else if (!value.contains('@')) {
                return AppStrings.emailError2;
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFieldWidget(
              label: AppStrings.password,
              controller: _passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.passwordError1;
                } else if (value.length < 6) {
                  return AppStrings.passwordError2;
                } else {
                  return null;
                }
              }),
          SizedBox(
            height: 15.h,
          ),
          OpenContainer(
            closedColor: Colors.transparent,
            openColor: Colors.transparent,
            middleColor: Colors.transparent,
            openElevation: 0,
            closedElevation: 0,
            openBuilder: (context, action) => const ForgotPasswordScreen(),
            closedBuilder: (context, action) => Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: action,
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                ),
                child: Text(AppStrings.forgotYourPassword),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
            onPressed: submit,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginErrorState) {
                  showErrorToast(context, state.message);
                } else if (state is AuthLoginWithLoadingState) {
                  showLoadingDialog(context);
                } else if (state is AuthSuccessState) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.main, (route) => false);
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const LoadingWidget(
                    color: AppColors.white,
                  );
                } else {
                  return Text(AppStrings.login.toUpperCase());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
