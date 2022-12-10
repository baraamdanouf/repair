import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillController extends GetxController {
  final GlobalKey<ScaffoldState> billKey = GlobalKey<ScaffoldState>();
  final TextEditingController materialController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController individualController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController statementController = TextEditingController();
  final TextEditingController problemController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
    materialController.dispose();
    quantityController.dispose();
    individualController.dispose();
    totalController.dispose();
    statementController.dispose();
    problemController.dispose();
  }
}
