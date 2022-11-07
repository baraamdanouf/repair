import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> loginKey = GlobalKey<ScaffoldState>();

  final phoneKey = GlobalKey();
  final passwordKey = GlobalKey();

  final loginBtnKey = GlobalKey();
  final signUpBtnKey = GlobalKey();

  final isChecked = false.obs;


  late TextEditingController phoneController = TextEditingController(),
      passwordController = TextEditingController();

}
