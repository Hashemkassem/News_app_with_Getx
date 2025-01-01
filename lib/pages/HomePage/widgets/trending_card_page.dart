import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:news_app_with_getx/pages/NewsDetails/news_details.dart';

class TrendingCard extends StatelessWidget {
  final NewsModel newsModel;
  const TrendingCard({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Get.to(NewsDetails(newsModel: newsModel)),
        child: Container(
          // margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(5),

          // height: 300,
          // MediaQuery.of(context).size.height * 0.25,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          // MediaQuery.of(context).size.width * 0.6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      height: 200,
                      fit: BoxFit.cover,
                      imageUrl: newsModel.urlToImage ??
                          'https://docs.flutter.dev/assets/images/branding/flutter/logo/flutter-mono-81x100.png',
                      progressIndicatorBuilder: (context, url, progress) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // ignore: unnecessary_string_interpolations
                      "Published At: ${getTimeElapsed(newsModel.publishedAt)}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        // ignore: unnecessary_string_interpolations
                        "${newsModel.title}",
                        maxLines: 2,
                        // style: TextStyle(fontSize: 24),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      '${newsModel.author}',
                      style: Theme.of(context).textTheme.labelSmall,
                      maxLines: 1,
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTimeElapsed(DateTime publishedAt) {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
