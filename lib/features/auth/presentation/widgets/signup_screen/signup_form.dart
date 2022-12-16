import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:ecommerce_app/features/auth/domain/entities/register.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/core/utils/custom_text_field_widget.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

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
            label: 'name'.tr(),
            controller: _nameController,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'name_error'.tr();
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFieldWidget(
            label: 'email'.tr(),
            controller: _emailController,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'email_error1'.tr();
              } else if (!value.contains('@')) {
                return 'email_error2'.tr();
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFieldWidget(
              label: 'password'.tr(),
              controller: _passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'password_error1'.tr();
                } else if (value.length < 6) {
                  return 'password_error2'.tr();
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
              child: Text('already_have_account'.tr()),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
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
                if (state is SignUpErrorState) {
                  showToast(state.message, AppColors.errorColor);
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
                  return Text('sign_up'.tr().toUpperCase());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
