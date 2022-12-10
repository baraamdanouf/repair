import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/local_storage.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> loginKey = GlobalKey<ScaffoldState>();

  final phoneKey = GlobalKey();
  final passwordKey = GlobalKey();

  final loginBtnKey = GlobalKey();
  final signUpBtnKey = GlobalKey();

  final isChecked = false.obs;

  final RxInt? selectedValue = LocalStorage.roleSelected.obs;


  late TextEditingController phoneController = TextEditingController(),
      passwordController = TextEditingController();

  void onSelected(value) async {
    selectedValue!.value = value;
    LocalStorage.saveRole(value);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
