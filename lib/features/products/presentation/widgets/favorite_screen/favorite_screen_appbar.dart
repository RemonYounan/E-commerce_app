import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/core/providers/global_provider.dart';

class FavoriteScreenAppBar extends StatelessWidget {
  const FavoriteScreenAppBar({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 140.h,
      collapsedHeight: 110.h,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: EdgeInsets.only(left: 14.w),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.favorites,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              children: [
                const Icon(
                  Icons.filter_list,
                  size: 24,
                ),
                SizedBox(width: 5.w),
                Text(
                  AppStrings.filters,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Spacer(),
                IconButton(
                  splashRadius: 18,
                  onPressed: () {
                    Provider.of<GlobalProvider>(context, listen: false)
                        .changeListStyle();
                    scrollController.jumpTo(0);
                  },
                  icon: Provider.of<GlobalProvider>(context).listStyle ==
                          ListStyle.grid
                      ? const Icon(Icons.list_rounded)
                      : const Icon(Icons.grid_view_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
