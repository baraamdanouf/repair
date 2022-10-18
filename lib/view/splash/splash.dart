import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/view/splash/splash_controller.dart';

import '../login/login.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    controller.animationController.forward();
    Timer(const Duration(seconds: 7), () => Get.off(const Login()));
    return ScreenUtilInit(
      designSize: const Size(414, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.splashKey,
        body: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SlideTransition(
                  position: controller.animation2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 100.sp, bottom: 15.sp),
                        child: SvgPicture.asset(
                          imgLogo,
                          height: 205.h,
                          width: 212.w,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Container(
                            margin: EdgeInsets.all(7.sp),
                            width: 9.sp,
                            height: 9.sp,
                            decoration: const BoxDecoration(
                                color: greyDark, shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SlideTransition(
                  position: controller.animation1,
                  child: Text(
                    "All Right Reserved to REPAIR HOME SERVICE® 2022",
                    style: TextStyle(
                      fontSize: textVeryVerySmall,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
