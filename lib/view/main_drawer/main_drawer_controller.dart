import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/local_storage.dart';

class MainDrawerController extends GetxController {
  final GlobalKey<ScaffoldState> mainKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> mainKey1 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> mainKey2 = GlobalKey<ScaffoldState>();
  var selectedIndex = 4.obs;

  void changeIndex(int index)
  {
    selectedIndex.value = index;
  }

  late PageController pageController = PageController();
  final GlobalKey<NavigatorState> RIKey1 = new GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> RIKey2 = new GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> RIKey3 = new GlobalKey<NavigatorState>();


  final RxString? selectedValue = LocalStorage.languageSelected.obs;

  void onSelected(String value) async {
    selectedValue!.value = value;
    LocalStorage.savedLanguageToDisk(value);
    await Get.updateLocale(Locale(value));}

  @override
  void onInit() {
    super.onInit();

   // calculateSize(keyDrawer);
  }

}
