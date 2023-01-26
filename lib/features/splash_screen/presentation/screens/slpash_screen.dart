// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/app_routes.dart';
import '../../../auth/presentation/blocs/auth/auth_cubit.dart';

class SlpashScreen extends StatefulWidget {
  const SlpashScreen({Key? key}) : super(key: key);

  @override
  State<SlpashScreen> createState() => _SlpashScreenState();
}

class _SlpashScreenState extends State<SlpashScreen> {
  ConnectivityResult? _connectivityResult;
  late StreamSubscription _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _checkConnectivityState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        BlocProvider.of<AuthCubit>(context).checkAuthToken();
        _connectivityResult = result;
      });
    });
  }

  @override
  dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      fToast.init(context);
      showToast(
        context: context,
        color: AppColors.errorColor,
        title: AppStrings.noInternet,
        duration: const Duration(seconds: 3),
      );
    }
    setState(() {
      _connectivityResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (_connectivityResult == ConnectivityResult.wifi ||
              _connectivityResult == ConnectivityResult.mobile) {
            if (state is AuthSuccessState) {
              Navigator.pushReplacementNamed(context, AppRoutes.main);
            } else if (state is NoTokenState) {
              Navigator.pushReplacementNamed(context, AppRoutes.signUp);
            } else if (state is AuthErrorState) {
              fToast.init(context);
              showToast(
                  context: context,
                  color: AppColors.errorColor,
                  title: state.message);
            }
          }
        },
        builder: (context, state) {
          return const LoadingWidget();
        },
      ),
    );
  }
}
