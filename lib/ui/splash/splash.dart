import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/ui/auth/login/login.dart';
import 'package:repair_app/ui/splash/splash_controller.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    controller.animationController.forward();
    Timer(const Duration(seconds: 2), () =>Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Login(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    ));
    return Scaffold(
              key: controller.splashKey,
              body: SafeArea(
                child: Container(
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
                                      color: greyDrawer.withOpacity(0.5),
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
              ),
            );
  }
}
