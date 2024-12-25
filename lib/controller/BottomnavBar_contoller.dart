import 'package:get/get.dart';
import 'package:news_app_with_getx/pages/ArticalsPage/artical._page.dart';
import 'package:news_app_with_getx/pages/HomePage/home_page.dart';
import 'package:news_app_with_getx/pages/Profile/profile_page.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const HomePage(),
    const ArticalPage(),
    const ProfilePage(),
  ];
}
