import 'package:animations/animations.dart';
// ignore: unused_import
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/utils/show_error_toast.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/app_routes.dart';
import '../../../../../core/common/app_text_styles.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/providers/global_provider.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../../../core/utils/custom_text_field_widget.dart';
import '../../../../../core/utils/loading_widget.dart';
import '../../../domain/entities/register.dart';
import '../../blocs/auth/auth_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus!.unfocus();
      final data = Register(
        email: _emailController.text,
        name: _nameController.text,
        passwrod: _passwordController.text,
      );
      context.read<AuthCubit>().register(data);
    } else {
      // show error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFieldWidget(
            label: AppStrings.name,
            controller: _nameController,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.nameError;
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
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
            openBuilder: (context, action) => const LoginScreen(),
            closedBuilder: (context, action) => Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: action,
                style: TextButton.styleFrom(
                  textStyle: AppTextStyle.titleMediumTextStyle(context),
                ),
                child: Text(AppStrings.alreadyHaveAccount),
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
                if (state is SignUpErrorState) {
                  showErrorToast(context, state.message);
                } else if (state is AuthLoginWithLoadingState) {
                  showLoadingDialog(context);
                } else if (state is AuthSuccessState) {
                  Provider.of<GlobalProvider>(context, listen: false)
                      .changeIndex(0);
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
                  return Text(AppStrings.signUp.toUpperCase());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
