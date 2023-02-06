import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/utils/error_message_wiget.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/core/utils/placeholder_loading_widget.dart';

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
