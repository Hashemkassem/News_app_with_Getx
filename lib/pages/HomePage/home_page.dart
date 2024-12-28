import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/component/navigation_bar.dart';
import 'package:news_app_with_getx/controller/NewsController.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/new_Tile.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/trending_card_page.dart';
import 'package:news_app_with_getx/pages/NewsDetails/news_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      floatingActionButton: const MyBotttomNav(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(4, 4),
                                blurRadius: 15,
                              )
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          'assets/gif/newspaper.gif',
                          height: 30,
                        ),
                      ),
                    ),
                    Text(
                      'NEWSWEEKERS',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(4, 4),
                              blurRadius: 15,
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/gif/personn.gif',
                        height: 30,
                      ),
                    )
                  ],
                ),
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
                    if (newsController.newsList.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 340,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newsController.newsList.length,
                          itemBuilder: (context, index) {
                            NewsModel news = newsController.newsList[index];
                            return TrendingCard(
                              newsModel: news,
                            );
                          },
                        ),
                      );
                    }
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
                SizedBox(
                    height: 500,
                    child: Obx(() {
                      if (newsController.newsList.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          itemCount: newsController.newsList.length,
                          itemBuilder: (context, index) {
                            NewsModel news = newsController.newsList[index];
                            return NewTile(
                              newsModel: news,
                            );
                          },
                        );
                      }
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
