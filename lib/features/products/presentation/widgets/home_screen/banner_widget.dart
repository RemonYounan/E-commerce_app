import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/common/app_colors.dart';
import '../../blocs/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_gifs/loading_gifs.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.status == ProductsStatus.loading) {
          return SizedBox(
            height: 240.h,
          );
        } else if (state.status == ProductsStatus.error) {
          return const ErrorMessageWiget();
        } else {
          final banners = state.banners;
          return SizedBox(
            height: 220.h,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: PageView.builder(
                    key: const PageStorageKey('banner'),
                    controller: _controller,
                    itemCount: 2,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        FadeInImage.assetNetwork(
                          placeholder: cupertinoActivityIndicatorSmall,
                          image: banners[0].img,
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.scaleDown,
                          height: 200.h,
                          width: double.infinity,
                        ),
                        Positioned(
                          left: 16.w,
                          bottom: 15.h,
                          child: Text(
                            banners[0].title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect: JumpingDotEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      verticalOffset: 2,
                      dotColor: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.greyDark
                          : AppColors.grey,
                    ),
                    onDotClicked: (index) => _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
