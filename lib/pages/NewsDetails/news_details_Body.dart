import 'package:flutter/material.dart';
import 'package:news_app_with_getx/model/new_model.dart';

class NewsDetailsBody extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetailsBody({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Center(
                  child: Text(newsModel.source.name[0],
                      style: TextStyle(fontSize: 24)),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                newsModel.source.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
        SizedBox(
            height: 400,
            child: Text(
              newsModel.content ?? 'No Content',
              style: Theme.of(context).textTheme.bodyLarge,
            ))
      ],
    );
  }
}
