import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPaymentController extends GetxController
    with SingleGetTickerProviderMixin {
  final GlobalKey<ScaffoldState> firstPaymentKey = GlobalKey<ScaffoldState>();

  late final TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
