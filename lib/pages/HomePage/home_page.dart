import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/controller/NewsController.dart';
import 'package:news_app_with_getx/pages/DemoPage/new_tile_demo.dart';
import 'package:news_app_with_getx/pages/DemoPage/trending_card_page.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/new_Tile.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/news_category_view.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/trending_card_page.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
          ),
        )),
        backgroundColor: Colors.transparent,
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.3)),
              padding: const EdgeInsets.all(5),
              child: ZoomTapAnimation(
                child: Image.asset(
                  'assets/gif/search_green.gif',
                  height: 20,
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.3)),
                padding: const EdgeInsets.all(5),
                child: ZoomTapAnimation(
                  child: Image.asset(
                    'assets/gif/personn.gif',
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.3)),
                padding: const EdgeInsets.all(5),
                child: ZoomTapAnimation(
                  child: Image.asset(
                    'assets/gif/notefication_green.gif',
                    height: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hottest News',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'See All',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(
              () {
                if (newsController.breakingNewsList.isEmpty) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        TrendingDemoCard(),
                        SizedBox(
                          width: 20,
                        ),
                        TrendingDemoCard(),
                        SizedBox(
                          width: 20,
                        ),
                        TrendingDemoCard(),
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: newsController.breakingNewsList
                          .map((e) => TrendingCard(newsModel: e))
                          .toList(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              isScrollable: true,

              labelColor: Colors.white,
              indicatorPadding: EdgeInsets.only(right: 5, left: 5),
              // labelPadding: EdgeInsets.all(5),
              automaticIndicatorColorAdjustment: true,
              splashBorderRadius: BorderRadius.circular(15),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.primary),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              tabs: newsController.categories
                  .map((category) => Tab(text: category.capitalizeFirst))
                  .toList(),
              unselectedLabelColor: const Color.fromARGB(255, 122, 122, 122),
              controller: newsController.tabController,
              onTap: (index) {
                newsController.changeCategory(newsController.categories[index]);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hottest News',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'See All',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // TabBarView(
            //   controller: newsController.tabController,
            //   children:
            // newsController.categories
            //     .map((category) => NewsCategoryView(category: category))
            //     .toList(),
            // )
            Obx(() {
              if (newsController.newsheadList.isEmpty) {
                return SingleChildScrollView(
                  child: Column(
                    children: const [
                      NewTileDemo(),
                      SizedBox(
                        height: 20,
                      ),
                      NewTileDemo(),
                      SizedBox(
                        height: 20,
                      ),
                      NewTileDemo(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              } else {
                if (newsController.isLoading.value) {
                  return SingleChildScrollView(
                    child: Column(
                      children: const [
                        NewTileDemo(),
                        SizedBox(
                          height: 20,
                        ),
                        NewTileDemo(),
                        SizedBox(
                          height: 20,
                        ),
                        NewTileDemo(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: newsController.tabController,
                      children: newsController.categories
                          .map((e) => NewsCategoryView(
                                category: e,
                              ))
                          .toList(),
                    ),
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
