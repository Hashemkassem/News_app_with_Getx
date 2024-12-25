// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NewTile extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String tag;
  final String time;
  const NewTile(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.tag,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
                color: Colors.black,
                // Theme.of(context).colorScheme.secondary,
                offset: Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1),
            BoxShadow(
                color: Theme.of(context).colorScheme.surface,
                offset: const Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                boxShadow: [
                  const BoxShadow(
                      color: Colors.black,
                      // Theme.of(context).colorScheme.secondary,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Theme.of(context).colorScheme.surface,
                      offset: const Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imgUrl, fit: BoxFit.cover),
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
                        radius: 15,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('$title')
                    ],
                  ),
                  Text(
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                      maxLines: 3,
                      tag),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
