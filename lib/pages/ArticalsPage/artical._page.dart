import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_app_with_getx/component/navigation_bar.dart';

import '../../controller/NewsController.dart';
import '../HomePage/widgets/new_Tile.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey =
        GlobalKey<LiquidPullToRefreshState>();
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      // floatingActionButton: MyBotttomNav(),
      body: LiquidPullToRefresh(
        key: refreshIndicatorKey,
        onRefresh: () async {
          newsController.loadBookmarks();
          print('${newsController.bookmarks.length}');
        },
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Obx(() {
                if (newsController.bookmarks.isNotEmpty) {
                  return ListView.builder(
                    itemCount: newsController.bookmarks.length,
                    itemBuilder: (context, index) {
                      return NewTile(
                        newsModel: newsController.bookmarks[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/gif/search_gray.gif',
                          height: 150,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'No BookMark Yet',
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                  );
                }
              })),
        ),
      ),
    );
  }
}
