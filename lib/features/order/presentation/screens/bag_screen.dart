import '../../../../core/common/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_text_field_widget.dart';
import '../blocs/cart/cart_cubit.dart';
import '../widgets/product_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 100.h,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.05,
                titlePadding: EdgeInsets.only(left: 14.w, bottom: 5.h),
                title: Text(
                  AppStrings.myBag,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final cartProducts = state.cart.products ?? [];
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        shrinkWrap: true,
                        key: const PageStorageKey('FeaturesProductsList'),
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          return ProductCartCard(
                            cartProduct: cartProducts[index],
                            count: cartProducts[index].count,
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 190.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: const CheckOut(),
    );
  }
}

class CheckOut extends StatefulWidget {
  const CheckOut({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late TextEditingController _promoController;

  @override
  void initState() {
    super.initState();
    _promoController = TextEditingController();
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextFieldWidget(
              label: AppStrings.enterPromoCode,
              controller: _promoController,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  AppStrings.totalAmount,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.greyDark),
                ),
                const Spacer(),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      '${state.cart.totalAmount.toInt()}\$',
                      style: Theme.of(context).textTheme.headlineSmall,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(
              child: Text(AppStrings.checkOut.toUpperCase()),
              onPressed: () {},
            ),
          ],
        ));
  }
}
