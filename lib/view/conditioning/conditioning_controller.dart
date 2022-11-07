import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditioningController extends GetxController {
  final GlobalKey<ScaffoldState> conditioningKey = GlobalKey<ScaffoldState>();
  var selectedService = 0.obs;

  void onChangeService(var service) {
    selectedService.value = service;
  }
}
