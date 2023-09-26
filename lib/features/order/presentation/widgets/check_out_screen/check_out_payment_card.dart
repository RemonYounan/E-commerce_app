import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/features/profile/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutPaymentCard extends StatelessWidget {
  const CheckOutPaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final isVisa = state.cards
                .firstWhere(
                    (element) => element.cardNumber == state.defaultCard)
                .type ==
            CardType.visa;
        return Row(
          children: [
            Container(
              height: 45.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: isVisa ? Colors.transparent : AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  isVisa ? AppAssets.visaIcon : AppAssets.mastercardIcon,
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Text(
              state.defaultCard
                  .toString()
                  .replaceRange(0, 12, '****  ****  ****  '),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        );
      },
    );
  }
}
