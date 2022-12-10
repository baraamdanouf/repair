import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/local_storage.dart';

class MainPageController extends GetxController {
  final GlobalKey<ScaffoldState> mainKey = GlobalKey<ScaffoldState>();

  var selectedIndex = 2.obs;

  void changeIndex(int index)
  {
    selectedIndex.value = index;
  }

  late PageController pageController = PageController();
  final GlobalKey<NavigatorState> navKeyNotifications = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> navKeyHome =  GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> navKeyProfile =  GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> navKeyReports =  GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> navKeyContracts =  GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> navKeyPayments =  GlobalKey<NavigatorState>();

  // final RxString? selectedValue = LocalStorage.languageSelected.obs;

  // void onSelected(String value) async {
  //   selectedValue!.value = value;
  //   LocalStorage.savedLanguageToDisk(value);
  //   await Get.updateLocale(Locale(value));}

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 2);
  }
  @override
  void dispose() {
    super.dispose();
  }
}
