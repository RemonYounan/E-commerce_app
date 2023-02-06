import 'package:carousel_slider/carousel_slider.dart';
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
  int _currentIndex = 0;
  late CarouselController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
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
            height: 250.h,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: banners.length,
                    itemBuilder: (context, index, realIndex) => Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: FadeInImage.assetNetwork(
                            placeholder: cupertinoActivityIndicatorSmall,
                            image: banners[index].img,
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.scaleDown,
                            height: 200.h,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          left: 16.w,
                          bottom: 15.h,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: AppColors.lightBlack.withOpacity(0.4),
                            child: Text(
                              banners[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (i, _) {
                        setState(() {
                          _currentIndex = i;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    banners.length,
                    (index) => GestureDetector(
                      onTap: () => _controller.animateToPage(
                        index,
                        curve: Curves.easeInOut,
                      ),
                      child: Container(
                        width: 12.r,
                        height: 12.r,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 4.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).primaryColor).withOpacity(
                                _currentIndex == index ? 0.9 : 0.2)),
                      ),
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
