import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/home/home_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final width = MediaQuery.of(context).size.width;
    const int role = 0;

    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => Scaffold(
              key: controller.homeKey,
              appBar: AppBar(
                centerTitle: true,
                toolbarHeight:
                    LocalStorage.languageSelected == "ar" ? 284.h : 290.h,
                elevation: 0,
                actions: [
                  CustomPageContainer(
                    isService: false,
                    isFilter: false,
                    text: "services cases".tr,
                    isDashboardIcons: false,
                    isDashboard: true,
                    role: 1,
                  )
                ],
              ),
              body: Container(
                margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
                // height: height,
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
                              role == 0
                                  ? Navigator.pushNamed(
                                      context, 'service_request')
                                  : Navigator.pushNamed(context, 'plumbing');
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
                              title: "lighting \nand lighting".tr),
                          serviceItem(
                              onTap: () {
                                role == 0
                                    ? Navigator.pushNamed(
                                    context, 'service_request')
                                    : Navigator.pushNamed(context, 'condition');
                              },
                              image: airConditioner,
                              colorStart: const Color(0xff006093),
                              colorEnd: const Color(0xff1c3b70),
                              title: "air conditioning \nand refrigeration".tr),
                          serviceItem(
                              onTap: () {},
                              image: chandelier,
                              colorStart: const Color(0xff00935d),
                              colorEnd: const Color(0xff1c7069),
                              //   heightText: 0.5,
                              title: "cleaning \nand sterilization".tr),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
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
    child: Container(
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
          Text(
            title ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.h,
                height: heightText,
                color: secondaryColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
