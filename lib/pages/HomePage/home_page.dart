import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/component/navigation_bar.dart';
import 'package:news_app_with_getx/controller/NewsController.dart';
import 'package:news_app_with_getx/pages/DemoPage/new_tile_demo.dart';
import 'package:news_app_with_getx/pages/DemoPage/trending_card_page.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/new_Tile.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/trending_card_page.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
      floatingActionButton: const MyBotttomNav(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.transparent,
          ),
        )),
        backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(200),
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primaryContainer),
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
        title: Text(
          'NEWSWEEKERS',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.primaryContainer),
                padding: const EdgeInsets.all(5),
                child: ZoomTapAnimation(
                  child: Image.asset(
                    'assets/gif/personn.gif',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ), // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InkWell(
              //       child: Container(
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(50),
              //             color:
              //                 Theme.of(context).colorScheme.primaryContainer),
              //         padding: const EdgeInsets.all(5),
              //         child: ZoomTapAnimation(
              //           child: Image.asset(
              //             'assets/gif/search_green.gif',
              //             height: 30,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Text(
              //       'NEWSWEEKERS',
              //       style: Theme.of(context).textTheme.headlineLarge,
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(50),
              //           color:
              //               Theme.of(context).colorScheme.primaryContainer),
              //       padding: const EdgeInsets.all(5),
              //       child: ZoomTapAnimation(
              //         child: Image.asset(
              //           'assets/gif/personn.gif',
              //           height: 30,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 12,
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
                height: 12,
              ),
              Obx(
                () {
                  if (newsController.newsheadList.isEmpty) {
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
                        children: newsController.newsheadList
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
                indicatorPadding: EdgeInsets.only(right: 5, left: 5),
                // labelPadding: EdgeInsets.all(5),
                automaticIndicatorColorAdjustment: true,
                splashBorderRadius: BorderRadius.circular(15),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3)),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                tabs: newsController.mytaps,
                unselectedLabelColor: const Color.fromARGB(255, 122, 122, 122),
                controller: newsController.controller,
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
              Obx(() {
                if (newsController.newseveryList.isEmpty) {
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
                  return SingleChildScrollView(
                    child: Column(
                      children: newsController.newseveryList
                          .map((e) => NewTile(newsModel: e))
                          .toList(),
                    ),
                  );
                  // ListView.builder(
                  //   itemCount: newsController.newseveryList.length,
                  //   itemBuilder: (context, index) {
                  //     NewsModel news =
                  //         newsController.newseveryList[index];
                  //     return NewTile(
                  //       newsModel: news,
                  //     );
                  //   },
                  // );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
