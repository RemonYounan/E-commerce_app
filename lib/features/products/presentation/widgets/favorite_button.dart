import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/providers/global_provider.dart';
import '../../../auth/presentation/blocs/auth/auth_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.id,
    Key? key,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    final userId = BlocProvider.of<AuthCubit>(context).user.id;
    bool isFav =
        Provider.of<GlobalProvider>(context).favProducts['$id'] == true;
    return Container(
      height: 40.r,
      width: 40.r,
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
      child: Center(
        child: LikeButton(
          isLiked: isFav,
          size: 25.r,
          likeBuilder: (isLiked) {
            final icon = isLiked ? Icons.favorite : Icons.favorite_border;
            final color = isLiked ? Colors.red : AppColors.grey;
            return Icon(icon, color: color, size: 25.r);
          },
          onTap: (isLiked) async {
            Provider.of<GlobalProvider>(context, listen: false)
                .toggleFavorite(id, userId);
            return !isLiked;
          },
        ),
      ),
    );
  }
}
