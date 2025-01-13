// ignore_for_file: file_names

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
                  child: Text(
                    newsModel.title[0],
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  newsModel.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: 400,
            child: Text(
              '${newsModel.content ?? 'No Content'} ${newsModel.description ?? ''}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        )
      ],
    );
  }
}
