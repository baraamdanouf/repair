import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:repair_app/main_controller.dart';
import 'package:repair_app/ui/service_pages/rating/rating_controller.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/translation.dart';
import 'package:repair_app/ui/service_pages/set_appoinment/set_oppoinment_controller.dart';
import 'package:repair_app/ui/splash/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AppointmentController());
  runApp( const MyApp());
}

class MyApp extends GetView<MainController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: primaryColor));
    Get.put(MainController());
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        translations: Translation(),
        locale: Locale(controller.appLocal),
        theme: ThemeData(
          fontFamily: lemonda,
        ),
      ),
    );
  }
}
