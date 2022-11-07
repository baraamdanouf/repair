import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractsController extends GetxController {
  final GlobalKey<ScaffoldState> contractsKey = GlobalKey<ScaffoldState>();
  var selectedIndex = 4.obs;

  final GlobalKey<NavigatorState> RIKey1 = new GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> RIKey2 = new GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> RIKey3 = new GlobalKey<NavigatorState>();
  @override
  void onInit() {
    super.onInit();
  }
}
