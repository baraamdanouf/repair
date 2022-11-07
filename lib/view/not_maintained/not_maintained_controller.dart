import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotMaintainedController extends GetxController {
  final GlobalKey<ScaffoldState> notMaintainedKey = GlobalKey<ScaffoldState>();

  final TextEditingController descriptionController = TextEditingController();


  var selectedReason = 0.obs;

  void onChangeReason(var service) {
    selectedReason.value = service;
  }

}