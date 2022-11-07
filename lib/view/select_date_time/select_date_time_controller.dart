import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDateTimeController extends GetxController {
  final GlobalKey<ScaffoldState> selectDateTimeKey = GlobalKey<ScaffoldState>();

  RxList<String> times = RxList<String>([]);
  final dateTime1 = DateTime
      .now()
      .obs;
  final dateTime2 = DateTime
      .now()
      .obs;

  @override
  void onInit() {
    super.onInit();
  }
}
