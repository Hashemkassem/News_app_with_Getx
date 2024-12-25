import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/controller/BottomnavBar_contoller.dart';

class MyBotttomNav extends StatelessWidget {
  const MyBotttomNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 200,
            height: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  // onHover: (value) {},
                  onTap: () {
                    controller.index.value = 0;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceIn,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: controller.index.value == 0
                              ? Theme.of(context).colorScheme.primary
                              : null),
                      child: Icon(
                        Icons.home,
                        size: controller.index.value == 0 ? 30 : 25,
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      controller.index.value = 1;
                    },
                    child: Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.index.value == 1
                                ? Theme.of(context).colorScheme.primary
                                : null),
                        child: Icon(
                          Icons.book,
                          size: controller.index.value == 1 ? 30 : 25,
                          color: controller.index.value == 1
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () {
                      controller.index.value = 2;
                    },
                    child: Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.index.value == 2
                                ? Theme.of(context).colorScheme.primary
                                : null),
                        child: Icon(
                          Icons.settings,
                          size: controller.index.value == 2 ? 30 : 25,
                          color: controller.index.value == 2
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
