import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_colors.dart';
import '../../domain/entities/product.dart';

import '../../../order/presentation/blocs/cart/cart_cubit.dart';

class AddToBagButton extends StatelessWidget {
  const AddToBagButton({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CartCubit>(context).addToCart(product: product);
        fToast.init(context);
        showToast(
            context: context,
            title: AppStrings.addedToCart,
            color: AppColors.dark);
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 40.r,
        width: 40.r,
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.primaryColorDark
                : AppColors.primaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 8,
                color: AppColors.shadowColor,
              ),
            ]),
        child: Icon(
          Icons.shopping_bag_rounded,
          color: AppColors.whiteDark,
          size: 22.r,
        ),
      ),
    );
  }
}
