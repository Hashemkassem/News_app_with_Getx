import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SliverDetails extends StatelessWidget {
  const SliverDetails({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      leadingWidth: 45,
      expandedHeight: size.height * 0.4,
      leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.7)),
            child: ZoomTapAnimation(
              child: Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: Color(0xff30e849),
                  ),
                ),
              ),
            ),
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.7)),
            padding: const EdgeInsets.all(8),
            child: ZoomTapAnimation(
              child: Image.asset(
                'assets/gif/bookmark_green.gif',
                height: 25,
              ),
            ),
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: newsModel.urlToImage ??
                    'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
                  );
                },
                errorWidget: (context, url, error) {
                  return CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
                  );
                },
              ),
            ),
            // Positioned.fill(
            //   child: Opacity(
            //     opacity: 0.15,
            //     child: DecoratedBox(
            //       decoration: BoxDecoration(
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 50,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.6),
                        borderRadius: BorderRadius.circular(17)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        newsModel.category ?? 'Business',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          newsModel.title,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${removeTextBeforeComma(newsModel.author ?? 'No Author')} • ${getTimeElapsed(newsModel.publishedAt)}",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            )
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      pinned: true,
      // collapsedHeight: size.height * 0.1,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(
          height: 30,
          width: size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
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

  String removeTextBeforeComma(String text) {
    int commaIndex = text.indexOf(',');
    if (commaIndex != -1) {
      return text.substring(0, commaIndex).trim();
    } else {
      return text; // إذا لم يتم العثور على فاصلة، يرجع النص كما هو
    }
  }
}
