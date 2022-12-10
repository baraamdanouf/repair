import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelRequestController extends GetxController {
  final GlobalKey<ScaffoldState> cancelRequestKey = GlobalKey<ScaffoldState>();

  final TextEditingController problemController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
    problemController.dispose();
  }
}