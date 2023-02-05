// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_routes.dart';
import '../../../auth/presentation/blocs/auth/auth_cubit.dart';

class SlpashScreen extends StatefulWidget {
  const SlpashScreen({Key? key}) : super(key: key);

  @override
  State<SlpashScreen> createState() => _SlpashScreenState();
}

class _SlpashScreenState extends State<SlpashScreen> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _checkConnectivityState();
    if (mounted) {
      _connectivitySubscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          showErrorToast();
        } else if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          BlocProvider.of<AuthCubit>(context).checkAuthToken();
        }
      });
    }
  }

  @override
  dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) showErrorToast();
  }

  void showErrorToast() {
    fToast.init(context);
    showToast(
      context: context,
      color: AppColors.errorColor,
      title: AppStrings.noInternet,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (mounted) {
            if (state is AuthSuccessState) {
              Navigator.pushReplacementNamed(context, AppRoutes.main);
            } else if (state is NoTokenState) {
              Future.delayed(const Duration(seconds: 2)).then(
                (_) {
                  Navigator.pushReplacementNamed(context, AppRoutes.signUp);
                },
              );
            } else if (state is AuthErrorState) {
              fToast.init(context);
              showToast(
                  context: context,
                  color: AppColors.errorColor,
                  title: state.message);
            }
          }
        },
        child: Center(
          child: Image.asset(
            AppAssets.appIcon,
            height: 150.r,
            width: 150.r,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
