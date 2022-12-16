import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/core/utils/custom_text_field_widget.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus!.unfocus();
      context.read<AuthCubit>().forgotPassword(_emailController.text);
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
            label: 'Email',
            controller: _emailController,
            textInputAction: TextInputAction.done,
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
            height: 50.h,
          ),
          CustomButton(
            onPressed: submit,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                fToast.init(context);
                if (state is ForgotPasswordErrorState) {
                  showToast(state.message, AppColors.errorColor);
                } else if (state is ForgotPasswordSuccessState) {
                  showToast(state.message, AppColors.green);
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const CircularProgressIndicator(
                    color: AppColors.white,
                  );
                } else {
                  return Text('send'.tr().toUpperCase());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
