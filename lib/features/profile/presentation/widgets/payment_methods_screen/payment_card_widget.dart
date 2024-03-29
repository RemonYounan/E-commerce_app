import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/features/profile/domain/entities/credit_card.dart';
import 'package:ecommerce_app/features/profile/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/app_text_styles.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({
    Key? key,
    required this.card,
  }) : super(key: key);

  final CreditCard card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          key: Key(card.cardNumber.toString()),
          direction: DismissDirection.endToStart,
          background: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: AppColors.errorColor,
              ),
            ),
          ),
          confirmDismiss: (_) => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                      title: Text(AppStrings.deleteCard),
                      content: Text(AppStrings.deleteCardContent),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text(AppStrings.no),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Text(AppStrings.yes),
                        ),
                      ])).then((value) {
            if (value == null) {
              return;
            } else if (value) {
              BlocProvider.of<ProfileCubit>(context)
                  .removeCreditCard(card.cardNumber);
              return;
            } else {
              return;
            }
          }),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.asset(
                  card.type == CardType.master
                      ? AppAssets.masterCard
                      : AppAssets.visaCard,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 120.h,
                left: 30.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.cardNumber
                          .toString()
                          .replaceRange(0, 12, '****  ****  ****  '),
                      style: AppTextStyle.headlineTextStyle2(context)
                          .copyWith(color: AppColors.white),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              AppStrings.cardHolderName,
                              style: AppTextStyle.helperTextStyle1(context)
                                  .copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              card.name,
                              style: AppTextStyle.subheadTextStyle(context)
                                  .copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50.w),
                        Column(
                          children: [
                            Text(
                              AppStrings.expiryDate,
                              style: AppTextStyle.helperTextStyle1(context)
                                  .copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              card.expiryDate,
                              style: AppTextStyle.subheadTextStyle(context)
                                  .copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: BlocProvider.of<ProfileCubit>(context).defaultCard ==
                  card.cardNumber,
              onChanged: (_) {
                BlocProvider.of<ProfileCubit>(context)
                    .setDefaultCard(card.cardNumber);
              },
            ),
            Text(
              AppStrings.useAsDefaultPayment,
              style: AppTextStyle.titleMediumTextStyle(context),
            )
          ],
        ),
      ],
    );
  }
}
