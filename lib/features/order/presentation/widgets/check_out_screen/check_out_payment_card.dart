import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/core/utils/custom_text_button.dart';
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
        if (state.cards.isEmpty) {
          return SizedBox(
            height: 150.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.noCards,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CustomTextButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.payments,
                  ),
                  title: AppStrings.addNewCard,
                ),
              ],
            ),
          );
        } else {
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
        }
      },
    );
  }
}
