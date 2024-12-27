import 'package:flutter/material.dart';
import 'package:news_app_with_getx/model/new_model.dart';

class TrendingCard extends StatelessWidget {
  final NewsModel newsModel;
  // final String img;
  // final String title;
  // final String tag;
  // final String time;
  // final String author;
  // final VoidCallback ontap;
  const TrendingCard({
    super.key,
    required this.newsModel,
    // required this.img,
    // required this.title,
    // required this.tag,
    // required this.time,
    // required this.author,
    // required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, bottom: 20.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(5),

          // height: 300,
          // MediaQuery.of(context).size.height * 0.25,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          // MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surface,
                  // boxShadow: [
                  //   const BoxShadow(
                  //       color: Colors.black,
                  //       // Theme.of(context).colorScheme.secondary,
                  //       offset: Offset(4, 4),
                  //       blurRadius: 15,
                  //       spreadRadius: 1),
                  //   BoxShadow(
                  //       color: Theme.of(context).colorScheme.surface,
                  //       offset: const Offset(-4, -4),
                  //       blurRadius: 15,
                  //       spreadRadius: 1)
                  // ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    fit: BoxFit.cover,
                    newsModel.urlToImage,
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
                    "${newsModel.description}",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    // ignore: unnecessary_string_interpolations
                    "${newsModel.publishedAt}",
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
                  Text('${newsModel.author}')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
