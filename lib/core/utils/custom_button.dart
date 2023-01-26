import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: Theme.of(context).textTheme.titleSmall,
        foregroundColor: AppColors.white,
      ),
      onPressed: () => onPressed(),
      child: child,
    );
  }
}
