import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/shop_screen/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categories'.tr()),
        leading: IconButton(
          onPressed: () {
            Provider.of<GlobalProvider>(context, listen: false).changeIndex(0);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 22.r,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const CategoriesWidget(),
    );
  }
}
