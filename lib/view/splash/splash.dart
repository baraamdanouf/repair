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
    Timer(const Duration(seconds: 2), () => Get.offAll(const Login()));
    return ScreenUtilInit(
        designSize: const Size(428, 926),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 100.h),
                            child: SvgPicture.asset(
                              imgLogo,
                              height: 204.64.h,
                              width: 212.07.w,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 15.h),
                                width: 11.w,
                                height: 11.h,
                                decoration: BoxDecoration(
                                    color: greyDark.withOpacity(0.6),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "All Right Reserved to REPAIR HOME SERVICE® 2022",
                        style: TextStyle(
                          fontSize: 15.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ));
  }
}
