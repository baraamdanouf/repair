import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectApartmentController extends GetxController {
  final GlobalKey<ScaffoldState> selectApartmentKey = GlobalKey<ScaffoldState>();
  var selectedApartment = 0.obs;

  void onChangeService(var service) {
    selectedApartment.value = service;
  }
}