import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/ui/main/main_page.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_logo_container.dart';
import 'login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: controller.loginKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: height * 0.5,
        elevation: 0,
        actions: [CustomLogoContainer(text: "welcome".tr)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(top: 40.h, bottom: 80.h),
            height: 350.h,
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomEditText(
                    width: 310.w,
                    height: 55.h,
                    textEditingController: controller.phoneController,
                    inputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    textDirection: TextDirection.ltr,
                    hintText: "enter mobile number".tr,
                    labelText: "mobile number".tr,
                    cursorColor: primaryColor,
                    listFormat: [PhoneInputFormatter()],
                    icon: Icons.phone_android_sharp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomEditText(
                    width: 310.w,
                    height: 55.h,
                    textEditingController: controller.passwordController,
                    inputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    textDirection: TextDirection.ltr,
                    hintText: "password".tr,
                    labelText: "password".tr,
                    cursorColor: primaryColor,
                    obscureText: true,
                    icon: Icons.lock,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("save login date".tr,
                          style: TextStyle(
                              fontSize: 17.h,
                              color: primaryColor,
                              fontWeight: FontWeight.bold)),
                      Theme(
                        child: Obx(
                          () => Checkbox(
                              autofocus: true,
                              value: controller.isChecked.value,
                              onChanged: (value) {
                                controller.isChecked.value = value!;
                              },
                              activeColor: primaryColor,
                              checkColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                color: Colors.white60,
                              ))),
                        ),
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: greyVeryDark),
                      ),
                    ],
                  ),
                  Text("forget password".tr,
                      style: TextStyle(
                          fontSize: 17.h,
                          color: primaryColor,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const MainPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    text: "login".tr,
                    backgroundColor: primaryColor,
                    width: 145.w,
                  ),
                  Container(
                   width: 100.w,
                    child:  Obx(
                          () => DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Center(child: Text("supervisor", textAlign: TextAlign.start)),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Center(child: Text("worker")),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Center(child: Text("tenant")),
                            value: 2,
                          ),
                        ],
                        onChanged: (value) async {
                          controller.onSelected(value);
                          print(value);
                          print(LocalStorage.roleSelected);
                        },
                        value: controller.selectedValue!.value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconEnabledColor: Colors.white,
                        //Icon color
                        underline: Container(),
                      ),
                    ),
                  ),
                  // CustomButton(
                  //   onPressed: () {},
                  //   text: "signUp".tr,
                  //   textColor: greyVeryDark,
                  //   borderColor: greyVeryDark,
                  //   width: 145.w,
                  // ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
