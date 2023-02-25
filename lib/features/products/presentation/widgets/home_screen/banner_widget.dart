import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:ecommerce_app/core/utils/placeholder_loading_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/common/app_colors.dart';
import '../../blocs/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
                    itemCount: banners.length,
                    itemBuilder: (context, index, realIndex) => Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                              imageUrl: banners[index].img,
                              placeholder: (context, url) =>
                                  const PlaceholderLoadingWidget(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16.w,
                          bottom: 15.h,
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
                      ],
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.45,
                      viewportFraction: 1,
                      onPageChanged: (i, _) {
                        setState(() {
                          _currentIndex = i;
                        });
                      },
                    ),
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: banners.length,
                  effect: WormEffect(
                    dotWidth: 12.r,
                    dotHeight: 12.r,
                    dotColor: isDark ? AppColors.greyDark : AppColors.grey,
                    activeDotColor: isDark
                        ? AppColors.primaryColorDark
                        : AppColors.primaryColor,
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
