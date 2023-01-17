import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:ecommerce_app/features/auth/domain/entities/login.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/core/utils/custom_text_field_widget.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.titleSmall,
              ),
              child: Text(AppStrings.forgotYourPassword),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.forgotPassword);
              },
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
            onPressed: submit,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                fToast.init(context);
                if (state is LoginErrorState) {
                  showToast(state.message, AppColors.errorColor);
                } else if (state is AuthSuccessState) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.main, (route) => false);
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const CircularProgressIndicator(
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
