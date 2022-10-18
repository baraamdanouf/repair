import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/splash/splash.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: primaryColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      theme: ThemeData(fontFamily: lemonda),
    );
  }
}
