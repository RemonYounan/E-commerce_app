import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/app_routes.dart';
import '../../../auth/presentation/blocs/auth/auth_cubit.dart';

class SlpashScreen extends StatelessWidget {
  const SlpashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pushReplacementNamed(context, AppRoutes.main);
          } else if (state is AuthErrorState) {
            Future.delayed(const Duration(seconds: 2)).then(
              (_) {
                Navigator.pushReplacementNamed(context, AppRoutes.signUp);
              },
            );
          }
        },
        child: const LoadingWidget(),
      ),
    );
  }
}
