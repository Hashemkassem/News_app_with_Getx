import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabs extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;

  final List<Tab> mytaps = <Tab>[
    Tab(
      text: 'Sport',
    ),
    Tab(
      text: 'Sport',
    ),
  ];
  @override
  void onInit() {
    controller = TabController(length: mytaps.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
