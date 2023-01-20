import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/toast.dart';
import '../../blocs/auth/auth_cubit.dart';
import '../../../../../core/utils/custom_text_field_widget.dart';
import '../../../../../core/utils/custom_button.dart';
import 'package:flutter/material.dart';
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
            height: 50.h,
          ),
          CustomButton(
            onPressed: submit,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                fToast.init(context);
                if (state is ForgotPasswordErrorState) {
                  showToast(
                      context: context,
                      title: state.message,
                      color: AppColors.errorColor);
                } else if (state is ForgotPasswordSuccessState) {
                  showToast(
                      context: context,
                      title: state.message,
                      color: AppColors.green);
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const CircularProgressIndicator(
                    color: AppColors.white,
                  );
                } else {
                  return Text(AppStrings.send.toUpperCase());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
