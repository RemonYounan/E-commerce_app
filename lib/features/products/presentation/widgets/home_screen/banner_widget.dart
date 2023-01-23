import 'package:ecommerce_app/core/utils/error_message_widget.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_bloc/products_bloc.dart';

import '../../../../../core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_gifs/loading_gifs.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.status == ProductsStatus.loading) {
          return const LoadingWidget();
        } else if (state.status == ProductsStatus.error) {
          return const ErrorMessageWidget();
        } else {
          final banners = state.banners;
          return SizedBox(
            height: 200.h,
            child: PageView.builder(
              key: const PageStorageKey('banner'),
              itemCount: 2,
              itemBuilder: (context, index) => Stack(
                children: [
                  FadeInImage.assetNetwork(
                    placeholder: cupertinoActivityIndicatorSmall,
                    image: banners[0].img,
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.scaleDown,
                    height: 196.h,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: 16.w,
                    bottom: 12.h,
                    child: Text(
                      banners[0].title,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w900,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
