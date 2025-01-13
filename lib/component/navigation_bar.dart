import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/controller/NewsController.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyBotttomNav extends StatelessWidget {
  const MyBotttomNav({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        // onHover: (value) {},
                        onTap: () {
                          controller.index.value = 0;
                        },
                        child: Obx(
                          () => ZoomTapAnimation(
                            child: Image.asset(
                              controller.index.value == 0
                                  ? 'assets/gif/home_green.gif'
                                  : 'assets/gif/home_gray.gif',
                              height: controller.index.value == 0 ? 35 : 30,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            controller.index.value = 1;
                          },
                          child: Obx(
                            () => ZoomTapAnimation(
                              child: Image.asset(
                                controller.index.value == 1
                                    ? 'assets/gif/nav_bookmark_green.gif'
                                    : 'assets/gif/nav_bookmark_gray.gif',
                                height: controller.index.value == 1 ? 35 : 30,
                              ),
                            ),
                          )),
                      InkWell(
                          onTap: () {
                            controller.index.value = 2;
                          },
                          child: Obx(
                            () => ZoomTapAnimation(
                              child: Image.asset(
                                controller.index.value == 2
                                    ? 'assets/gif/settting_green.gif'
                                    : 'assets/gif/setting_gray.gif',
                                height: controller.index.value == 2 ? 35 : 30,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
