import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/features/profile/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/payment_methods_screen/payment_card_widget.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/shipping_addres_screen/no_addresses_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PaymentMethodsList extends StatelessWidget {
  const PaymentMethodsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              childAnimationBuilder: (child) => ScaleAnimation(
                child: FadeInAnimation(
                  child: child,
                ),
              ),
              children: [
                Text(
                  AppStrings.yourPayments,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoadingState) {
                      return const LoadingWidget();
                    } else if (state is ProfileErrorState) {
                      return const ErrorMessageWiget();
                    } else {
                      return state.cards.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.cards.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  PaymentCardWidget(
                                card: state.cards[index],
                              ),
                            )
                          : SizedBox(
                              height: 250.h,
                              child: const NoAddressesWidget(),
                            );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
