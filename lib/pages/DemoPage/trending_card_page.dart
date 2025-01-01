import 'package:flutter/material.dart';

import '../../component/loading_container.dart';

class TrendingDemoCard extends StatelessWidget {
  const TrendingDemoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(5),

      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      // MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          LoadingContainer(
              height: 200, width: MediaQuery.of(context).size.width),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoadingContainer(
                  height: 10, width: MediaQuery.of(context).size.width / 4),
              LoadingContainer(
                  height: 10, width: MediaQuery.of(context).size.width / 5),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadingContainer(
                      height: 10, width: MediaQuery.of(context).size.width / 3),
                  const SizedBox(
                    height: 5,
                  ),
                  LoadingContainer(
                      height: 10, width: MediaQuery.of(context).size.width / 4),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              LoadingContainer(height: 20, width: 20),
              const SizedBox(
                width: 10,
              ),
              LoadingContainer(
                  height: 10, width: MediaQuery.of(context).size.width / 3),
            ],
          )
        ],
      ),
    );
  }
}
