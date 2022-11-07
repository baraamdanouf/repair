import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/utils/translation.dart';
import 'package:repair_app/view/splash/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic lang = "ar";
      lang = LocalStorage.languageSelected;
 //   LocalStorage.savedLanguageToDisk(lang);
    Get.updateLocale(Locale(lang));
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: primaryColor));
    return GetMaterialApp(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      translations: Translation(),
      locale:  Locale(lang),
      theme: ThemeData(fontFamily: lemonda),
    );
  }
}
