import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    // const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    // const SystemUiOverlayStyle(statusBarColor: primaryColor);
    return  GetMaterialApp(
    debugShowCheckedModeBanner: false,
    //home: const Splash(),
    theme: ThemeData(
    //fontFamily: lemonda
    ),
   // supportedLocales: L10n.all,
    );
  }
}

