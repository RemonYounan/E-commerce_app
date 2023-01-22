// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/core/utils/custom_dropdown_button.dart';
import 'package:ecommerce_app/core/utils/custom_text_field_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/loading_widget.dart';

class AddShippingAddressForm extends StatefulWidget {
  const AddShippingAddressForm({
    Key? key,
    this.address,
  }) : super(key: key);

  final Map<String, dynamic>? address;

  @override
  State<AddShippingAddressForm> createState() => _AddShippingAddressFormState();
}

class _AddShippingAddressFormState extends State<AddShippingAddressForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> newAddress = {};
  final List<Widget> textFiledsWidgets = [];

  @override
  void initState() {
    super.initState();
    buildFields();
  }

  void buildFields() {
    final addressFields = BlocProvider.of<ProductsCubit>(context).addressFields;
    addressFields.forEach(
      (key, value) {
        if (value['type'] == 'country') {
          final countries = BlocProvider.of<ProductsCubit>(context).countries;
          List<DropdownMenuItem> items = [
            DropdownMenuItem(
              value: value['label'],
              child: Text(value['label']),
            ),
          ];
          countries.forEach((key, value) {
            items.add(DropdownMenuItem(
              value: value,
              child: Text(value),
            ));
          });
          String currentValue = widget.address == null
              ? value['label'] as String
              : widget.address![key];
          void onChanged(dynamic value) {
            currentValue = value;
            newAddress.addAll(
              {key: value},
            );
          }

          textFiledsWidgets.add(
            CustomDropDownButton(
              currentValue: currentValue,
              items: items,
              onChanged: onChanged,
            ),
          );
        } else {
          TextInputType textInputType = TextInputType.name;
          if (value['type'] == 'tel' || value['label'].contains('ZIP')) {
            textInputType = TextInputType.phone;
          } else if (value['type'] == 'email') {
            TextInputType.emailAddress;
          }
          textFiledsWidgets.add(
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: CustomTextFieldWidget(
                label: value['label'],
                hintText: value['placeholder'],
                validator: value['required'] ? validate : null,
                controller: widget.address != null
                    ? TextEditingController(text: widget.address![key])
                    : null,
                textInputType: textInputType,
                onChanged: (value) {
                  newAddress.addAll(
                    {key: value},
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }

  void sumbit() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthCubit>(context).addAddress(newAddress);
    }
  }

  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'This Field is required';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              ...textFiledsWidgets,
              SizedBox(height: 10.h),
              CustomButton(
                onPressed: sumbit,
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const LoadingWidget(
                        color: AppColors.white,
                      );
                    } else {
                      return Text(
                        widget.address == null
                            ? AppStrings.saveAddress
                            : AppStrings.editAddress,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
