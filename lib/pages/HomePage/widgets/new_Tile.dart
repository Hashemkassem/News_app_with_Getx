// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/model/new_model.dart';

import '../../NewsDetails/news_details.dart';

class NewTile extends StatelessWidget {
  final NewsModel newsModel;
  const NewTile({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Get.to(NewsDetails(newsModel: newsModel)),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: newsModel.urlToImage ??
                        'https://docs.flutter.dev/assets/images/branding/flutter/logo/flutter-mono-81x100.png',
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(child: CircularProgressIndicator());
                    },
                    errorWidget: (context, url, error) {
                      return Center(child: CircularProgressIndicator());
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            '${newsModel.title}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                    Text(
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 5,
                      '${newsModel.description}',
                    ),
                    Text(
                      "Updated: ${getTimeElapsed(newsModel.publishedAt)}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              )
            ],
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
