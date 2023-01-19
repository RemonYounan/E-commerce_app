import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/providers/global_provider.dart';
import '../widgets/shop_screen/categories_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.categories),
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
