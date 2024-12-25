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
            width: 250,
            height: 60,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                  )
                ],
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
                    () => Image.asset(
                      controller.index.value == 0
                          ? 'assets/gif/home_green.gif'
                          : 'assets/gif/home_gray.gif',
                      height: controller.index.value == 0 ? 35 : 30,
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      controller.index.value = 1;
                    },
                    child: Obx(
                      () => Image.asset(
                        controller.index.value == 1
                            ? 'assets/gif/arical_green.gif'
                            : 'assets/gif/arical_gray.gif',
                        height: controller.index.value == 1 ? 35 : 30,
                      ),
                    )),
                InkWell(
                    onTap: () {
                      controller.index.value = 2;
                    },
                    child: Obx(
                      () => Image.asset(
                        controller.index.value == 2
                            ? 'assets/gif/settting_green.gif'
                            : 'assets/gif/setting_gray.gif',
                        height: controller.index.value == 2 ? 35 : 30,
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
