import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.id,
    Key? key,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccessState) {
          final userId = state.user.id;
          bool isFav =
              Provider.of<GlobalProvider>(context).favProducts['$id'] == true;
          return GestureDetector(
            onTap: () {
              Provider.of<GlobalProvider>(context, listen: false)
                  .toggleFavorite(id, userId);
            },
            child: Container(
              height: 38.r,
              width: 38.r,
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.dark
                      : AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                      color: AppColors.shadowColor,
                    ),
                  ]),
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_outline_rounded,
                color: isFav
                    ? AppColors.primaryColor
                    : (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.greyDark
                        : AppColors.grey),
                size: 20.r,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
