import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

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
                child: Text(
                    'Threads’ next update is a search feature that finds the post you’re looking for',
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
                    'Updated|2024-12-02',
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
                    Column(
                      children: [
                        Text(
                          'Wes Davis',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          'Wes Davis',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
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
                    'Threads next update is a search feature that finds the post youre looking for Threads next update is a search feature that finds the post youre looking for Youll be able to search for posts filt',
                    style: Theme.of(context).textTheme.labelLarge),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    'https://cdn.vox-cdn.com/thumbor/7F_fPNt4RPcVyi-RPF6ww3eAHOg=/11x40:1335x688/1200x628/filters:focal(679x321:680x322)/cdn.vox-cdn.com/uploads/chorus_asset/file/25770219/Threads_search_update.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
