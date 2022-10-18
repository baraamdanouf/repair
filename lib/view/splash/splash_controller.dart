import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> splashKey = GlobalKey<ScaffoldState>();
  late AnimationController animationController;
  late Animation<Offset> animation1, animation2;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation1 = Tween<Offset>(begin: const Offset(-0.0, 10.0), end: Offset.zero)
        .animate(animationController);
    animation2 = Tween<Offset>(
      begin: const Offset(-0.0, -1.0),
      end: Offset.zero,
    ).animate(animationController);
  }
}
