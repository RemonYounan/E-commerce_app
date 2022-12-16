import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SlpashScreen extends StatelessWidget {
  const SlpashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pushReplacementNamed(context, AppRoutes.main);
          } else {
            Future.delayed(const Duration(seconds: 2)).then(
              (_) {
                Navigator.pushReplacementNamed(context, AppRoutes.signUp);
              },
            );
          }
        },
        child: Center(
          child: Text(
            'Loading ...',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
