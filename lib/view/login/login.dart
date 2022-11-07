import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/main/main_page.dart';
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
    final width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => Scaffold(
              key: controller.loginKey,
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                toolbarHeight: height * 0.5,
                elevation: 0,
                actions: [CustomLogoContainer(text: "welcome".tr)],
              ),
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: KeyboardVisibilityBuilder(
                      builder: (context, visible) => Container(
                        margin: EdgeInsets.only(top: 40.h),
                        height: visible? height*0.6 : height * 0.45,
                        child: ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: [
                              Form(
                                key: controller.loginFormKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                      textEditingController:
                                          controller.passwordController,
                                      inputType: TextInputType.phone,
                                      textInputAction: TextInputAction.next,
                                      textDirection: TextDirection.ltr,
                                      hintText: "password".tr,
                                      labelText: "password".tr,
                                      cursorColor: primaryColor,
                                      obscureText: true,
                                      icon: Icons.lock,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [

                                        Text(
                                      "save login date".tr,
                                          style: TextStyle(
                                          fontSize: 17.h,
                                          color: primaryColor,
                                         fontWeight: FontWeight.bold
                                          )  ),
                                        Theme(
                                          child: Obx(
                                                () => Checkbox(
                                                autofocus: true,
                                                value:
                                                controller.isChecked.value,
                                                onChanged: (value) {
                                                  controller.isChecked.value =
                                                  value!;
                                                },
                                                activeColor: primaryColor,
                                                checkColor: Colors.white,
                                                shape:
                                                const RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Colors.white60,
                                                    ))),
                                          ),
                                          data: Theme.of(context).copyWith(
                                              unselectedWidgetColor:
                                              greyVeryDark),
                                        ),
                                      ],
                                    ),
                                    Text(
                                     "forget password".tr,
                                        style: TextStyle(
                                            fontSize: 17.h,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    CustomButton(
                                      onPressed: () {
                                        Get.offAll(const MainPage());
                                      },
                                      text: "login".tr,
                                      backgroundColor: primaryColor,
                                      width: 145.w,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    CustomButton(
                                      onPressed: () {},
                                      text: "signUp".tr,
                                      textColor: greyVeryDark,
                                      borderColor: greyVeryDark,
                                      width: 145.w,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
