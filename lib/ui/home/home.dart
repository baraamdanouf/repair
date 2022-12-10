import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/ui/home/home_controller.dart';
import 'package:repair_app/ui/service_pages/service_request/service_request.dart';
import 'package:repair_app/ui/service_pages/service_request/service_request_controller.dart';
import 'package:repair_app/ui/services/conditioning/conditioning.dart';
import 'package:repair_app/ui/services/plumbing/plumbing.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final width = MediaQuery.of(context).size.width;
    var role = LocalStorage.roleSelected;
    return DoubleBack(
      message: "Press again BACK to exit".tr,
      background: primaryColor,
      textStyle: const TextStyle(color: Colors.white),
      child: SafeArea(
        child: Scaffold(
          key: controller.homeKey,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight:
                LocalStorage.languageSelected == "ar" ? 284.h : 290.h,
            elevation: 0,
            actions: [
              CustomPageContainer(
                text: "services cases".tr,
                role: 0,
              )
            ],
          ),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
              width: width,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        serviceItem(
                          onTap: () {
                            Get.delete<ServiceRequestController>();
                            role == 2
                                ? Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const Plumbing(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                      // settings: RouteSettings(
                                      //   arguments: todos[index],
                                      // ),
                                    ),
                                  )
                                : Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const ServiceRequest(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                          },
                          image: faucet,
                          colorStart: const Color(0xff30d4fd),
                          colorEnd: const Color(0xff019ad6),
                          title: "plumbing".tr,
                        ),
                        serviceItem(
                            onTap: () {},
                            image: varnish,
                            colorStart: const Color(0xffffbf00),
                            colorEnd: const Color(0xffff9900),
                            title: "paint".tr),
                        serviceItem(
                            onTap: () {},
                            image: faucet,
                            colorStart: const Color(0xffff663d),
                            colorEnd: const Color(0xffff3d3d),
                            title: "kitchen services".tr),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        serviceItem(
                            onTap: () {},
                            image: chandelier,
                            colorStart: const Color(0xffed6a7c),
                            colorEnd: const Color(0xffef4e78),
                            title: "lighting and lighting".tr),
                        serviceItem(
                            onTap: () {
                              Get.delete<ServiceRequestController>();
                              role == 2
                                  ? Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const Conditioning(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    )
                                  : Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const ServiceRequest(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                            },
                            image: airConditioner,
                            colorStart: const Color(0xff006093),
                            colorEnd: const Color(0xff1c3b70),
                            title: "air conditioning and refrigeration".tr),
                        serviceItem(
                            onTap: () {},
                            image: chandelier,
                            colorStart: const Color(0xff00935d),
                            colorEnd: const Color(0xff1c7069),
                            title: "cleaning and sterilization".tr),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget serviceItem(
    {Color? colorStart,
    Color? colorEnd,
    double? heightText,
    required void Function()? onTap,
    required String image,
    required String? title}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Container(
            width: 111.w,
            height: 111.h,
            margin: EdgeInsets.only(top: 20.h),
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  colorStart ?? Colors.transparent,
                  colorEnd ?? Colors.transparent
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: SvgPicture.asset(image)),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          width: 120.w,
          child: Text(
            title ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.h,
                height: heightText,
                color: secondaryColor,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
