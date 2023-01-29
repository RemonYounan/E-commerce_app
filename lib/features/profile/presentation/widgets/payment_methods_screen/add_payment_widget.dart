import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/core/helpers/Card_number_formatter.dart';
import 'package:ecommerce_app/core/helpers/card_month_formatter.dart';
import 'package:ecommerce_app/core/helpers/card_utils.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/core/utils/custom_text_field_widget.dart';
import 'package:ecommerce_app/features/profile/domain/entities/credit_card.dart';
import 'package:ecommerce_app/features/profile/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPaymentWidget extends StatefulWidget {
  const AddPaymentWidget({Key? key}) : super(key: key);

  @override
  State<AddPaymentWidget> createState() => _AddPaymentWidgetState();
}

class _AddPaymentWidgetState extends State<AddPaymentWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController cardNumberController;
  late TextEditingController nameController;
  late TextEditingController expiryController;
  late TextEditingController cvvController;

  CardType cardType = CardType.invalid;

  @override
  void initState() {
    super.initState();
    cardNumberController = TextEditingController()
      ..addListener(() {
        getCardTypeFrmNumber();
      });
    nameController = TextEditingController();
    expiryController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    nameController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      final card = CreditCard(
        name: nameController.text,
        cardNumber:
            int.parse(CardUtils.getCleanedNumber(cardNumberController.text)),
        expiryDate: expiryController.text,
        cvv: int.parse(cvvController.text),
      );
      BlocProvider.of<ProfileCubit>(context).addCreditCard(card);
    }
  }

  bool canSubmit() {
    if (nameController.text.isNotEmpty &&
        cardNumberController.text.isNotEmpty &&
        expiryController.text.isNotEmpty &&
        cvvController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 15.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15.h,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.addNewCard,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  label: AppStrings.nameOnCard,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  label: AppStrings.cardNumber,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: cardNumberController,
                  suffixIcon: CardUtils.getCardIcon(cardType),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardNumberInputFormatter(),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  label: AppStrings.expiryDate,
                  textInputType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  controller: expiryController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardMonthInputFormatter(),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  label: AppStrings.cvv,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  controller: cvvController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text(
                      AppStrings.useAsDefaultPayment,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: canSubmit() ? submit : null,
                  child: Text(AppStrings.addCard),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
