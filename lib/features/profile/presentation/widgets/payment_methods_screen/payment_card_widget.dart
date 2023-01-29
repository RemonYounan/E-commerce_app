import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/features/profile/domain/entities/credit_card.dart';
import 'package:ecommerce_app/features/profile/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SvgPicture.asset(
                AppAssets.masterCard,
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
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            AppStrings.cardHolderName,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            card.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      SizedBox(width: 50.w),
                      Column(
                        children: [
                          Text(
                            AppStrings.expiryDate,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            card.expiryDate,
                            style: Theme.of(context).textTheme.titleLarge,
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
        Row(
          children: [
            Checkbox(
              value: BlocProvider.of<ProfileCubit>(context).defaultCard ==
                  card.cardNumber,
              onChanged: (value) {
                BlocProvider.of<ProfileCubit>(context)
                    .setDefaultCard(card.cardNumber);
              },
            ),
            Text(
              AppStrings.useAsDefaultPayment,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ],
    );
  }
}
