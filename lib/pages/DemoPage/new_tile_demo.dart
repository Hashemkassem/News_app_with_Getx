import 'package:flutter/material.dart';

import '../../component/loading_container.dart';

class NewTileDemo extends StatelessWidget {
  const NewTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          LoadingContainer(height: 120, width: 120),
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
                    LoadingContainer(height: 30, width: 30),
                    const SizedBox(
                      width: 10,
                    ),
                    LoadingContainer(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 5)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoadingContainer(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 3),
                    SizedBox(
                      height: 10,
                    ),
                    LoadingContainer(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 4),
                    SizedBox(
                      height: 10,
                    ),
                    LoadingContainer(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 5),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoadingContainer(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 4),
                    LoadingContainer(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 4),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
