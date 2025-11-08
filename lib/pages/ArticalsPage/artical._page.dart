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
      appBar: AppBar(
        title: Text('Bookmarked Articles'),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}, // No function
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {}, // No function
          ),
        ],
      ),
      body: LiquidPullToRefresh(
        key: refreshIndicatorKey,
        onRefresh: () async {
          newsController.loadBookmarks();
          print('${newsController.bookmarks.length}');
        },
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Obx(() {
              if (newsController.bookmarks.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Saved Articles',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '${newsController.bookmarks.length} articles saved',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: newsController.bookmarks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: NewTile(
                              newsModel: newsController.bookmarks[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/gif/bookmark_gray.gif',
                          height: 80,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'No Bookmarks Yet',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Save articles you want to read later',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {}, // No function
                        icon: Icon(Icons.explore),
                        label: Text('Explore Articles'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
