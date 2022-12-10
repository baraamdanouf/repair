import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlumbingController extends GetxController {
  final GlobalKey<ScaffoldState> plumbingKey = GlobalKey<ScaffoldState>();
  final isChecked1 = false.obs;
  final isChecked2 = true.obs;
  void onChangePluming1(var service) {
    isChecked1.value = service;
  }
}
