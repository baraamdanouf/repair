import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/main/main_page.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_logo_container.dart';
import 'package:repair_app/widgets/custom_text.dart';
import 'login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    final FocusNode phoneFocus = FocusNode();
    final FocusNode passwordFocus = FocusNode();

    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    void fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const CustomLogoContainer(text: "أهلا وسهلا"),
                   SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.none,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 50.h,),
                               CustomEditText(
                                  controller: phoneController,
                                  onSubmitted: (val) {
                                    phoneFocus.unfocus();
                                  },
                                   inputType: TextInputType.phone,
                                   textInputAction: TextInputAction.next,
                                  autoCorrect: false,
                                  hintText: "ادخل رقم جوالك",
                                  focusNode: passwordFocus,
                                  cursorColor: primaryColor,
                                      icon: Icons.phone_android_rounded
                                ),
                              SizedBox(height: 20.h,),
                              CustomEditText(
                                  controller: passwordController,
                                  onSubmitted: (val) {
                                    passwordFocus.unfocus();
                                  },
                                  inputType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  autoCorrect: false,
                                  hintText: "كلمة المرور",
                                  focusNode: passwordFocus,
                                  cursorColor: primaryColor,
                                  icon: Icons.password
                              ),
                              SizedBox(height: 20.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(value: false, onChanged: (value){},
                                      shape:
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2.sp),
                                          side: BorderSide(
                                            color: greyLite,
                                            width: 1.sp,
                                          )
                                      )),
                                  CustomText(
                                    text: "حفظ بيانات تسجيل الدخول",
                                    fontSize: textVeryVerySmall,
                                    color: primaryColor,
                                    bold: true,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h,),
                              CustomText(
                                text: "نسيت كلمة المرور",
                                fontSize: textVeryVerySmall,
                                color: primaryColor,
                                bold: true,
                              ),
                              SizedBox(height: 20.h,),
                              CustomButton(
                                onPressed: (){Get.to(const MainPage());},
                                text: "تسحيل الدخول",
                                backgroundColor: primaryColor,
                                width: 142.83.w,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
