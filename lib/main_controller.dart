import 'dart:ui';
import 'package:get/get.dart';
import 'package:repair_app/utils/local_storage.dart';

class MainController extends GetxController{
  String appLocal = 'ar';

  @override
  void onInit() async{
    super.onInit();
    appLocal = LocalStorage.languageSelected;
    LocalStorage.savedLanguageToDisk(appLocal);
    Get.updateLocale(Locale(appLocal));
    update();
  }
}