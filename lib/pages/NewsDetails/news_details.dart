import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/model/new_model.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                  )
                ],
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Icon(
              Icons.thumb_up_alt_outlined,
              size: 30,
              color: Color(0xff30e849),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                  )
                ],
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Icon(
              Icons.bookmark_border_rounded,
              size: 30,
              color: Color(0xff30e849),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                  )
                ],
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: const Icon(
              Icons.share_outlined,
              size: 30,
              color: Color(0xff30e849),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Color(0xff30e849),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(newsModel.title,
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Text(
                    "Published At: ${getTimeElapsed(newsModel.publishedAt)}",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      newsModel.author ?? 'No Author',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  newsModel.description ?? 'No Description',
                  // maxLines: 6,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                      // height: 200,
                      // width: 300,
                      child: CachedNetworkImage(
                          imageUrl: newsModel.urlToImage ??
                              'https://docs.flutter.dev/assets/images/branding/flutter/logo/flutter-mono-81x100.png'))),
            )
          ],
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
