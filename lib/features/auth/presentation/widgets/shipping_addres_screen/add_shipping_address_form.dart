// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/utils/toast.dart';
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
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
  List<DropdownMenuItem> statesItems = [];

  @override
  void initState() {
    super.initState();
    _buildFields();
  }

  void _buildFields() {
    final addressFields = BlocProvider.of<ProductsCubit>(context).addressFields;
    addressFields.forEach(
      (key, value) {
        if (value['type'] == 'country') {
          _buildCountryDropDownButton(key, value);
        } else if (value['type'] == 'state') {
          _buildStateDropDownButton(key, value);
        } else {
          _buildTextField(key, value);
        }
      },
    );
  }

  void _buildCountryDropDownButton(String key, dynamic value) {
    final countries = BlocProvider.of<ProductsCubit>(context).countries;
    List<DropdownMenuItem> items = [
      DropdownMenuItem(
        value: value['label'],
        enabled: false,
        child: Text(value['label']),
      ),
    ];
    countries.forEach((key, value) {
      items.add(DropdownMenuItem(
        value: key,
        onTap: () async {
          final states =
              await BlocProvider.of<AuthCubit>(context).getState(key);
          setState(() {
            statesItems.removeRange(1, statesItems.length);
            states.forEach((_, state) {
              statesItems.add(
                DropdownMenuItem(
                  value: state,
                  child: Text(state),
                ),
              );
            });
          });
        },
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
  }

  void _buildStateDropDownButton(String key, dynamic value) async {
    statesItems.add(
      DropdownMenuItem(
        value: value['label'],
        enabled: false,
        child: Text(value['label']),
      ),
    );
    if (widget.address != null) {
      statesItems.add(
        DropdownMenuItem(
          value: widget.address!['billing_state'],
          child: Text(widget.address!['billing_state']),
        ),
      );
    }
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
        items: statesItems,
        onChanged: onChanged,
      ),
    );
  }

  void _buildTextField(String key, dynamic value) {
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

  void sumbit() {
    FocusManager.instance.primaryFocus!.unfocus();
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
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  SizedBox(height: 10.h),
                  ...textFiledsWidgets,
                  SizedBox(height: 10.h),
                  CustomButton(
                    onPressed: sumbit,
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthErrorState) {
                          fToast.init(context);
                          showToast(context: context, title: state.message);
                        } else if (state is AuthSuccessState) {
                          Navigator.pop(context);
                        }
                      },
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
        ),
      ),
    );
  }
}
