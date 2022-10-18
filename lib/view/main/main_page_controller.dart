import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  final GlobalKey<ScaffoldState> mainKey = GlobalKey<ScaffoldState>();
  var tabIndex = 0.obs;
  GlobalKey bottomNavigation = GlobalKey();
  late PageController pageController = PageController();

  void changeTabIndex(int index)
  {
    tabIndex.value = index;
    update();
  }
}
