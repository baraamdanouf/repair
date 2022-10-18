import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/view/home/home_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return ScreenUtilInit(
      designSize: const Size(414, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.homeKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomPageContainer(
                text: "حالات الخدمات", isDashboard: true, isFilter: false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                serviceItem(
                  image: faucet,
                  colorStart: const Color(0xff30d4fd),
                  colorEnd: const Color(0xff019ad6),
                  title: "السباكة",
                ),
                serviceItem(
                    image: varnish,
                    colorStart: const Color(0xffffbf00),
                    colorEnd: const Color(0xffff9900),
                    title: "البويا والدهان"),
                serviceItem(
                    image: faucet,
                    colorStart: const Color(0xffff663d),
                    colorEnd: const Color(0xffff3d3d),
                    title: "خدمات المطبخ"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                serviceItem(
                    image: chandelier,
                    colorStart: const Color(0xffed6a7c),
                    colorEnd: const Color(0xffef4e78),
                    title: "اإنارة والإضاءة"),
                serviceItem(
                    image: airConditioner,
                    colorStart: const Color(0xff006093),
                    colorEnd: const Color(0xff1c3b70),
                    title: "التطييف والتبريد"),
                serviceItem(
                    image: chandelier,
                    colorStart: const Color(0xff00935d),
                    colorEnd: const Color(0xff1c7069),
                    title: "التنظيف والتعقيم"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget serviceItem(
    {Color? colorStart,
    Color? colorEnd,
    required String image,
    required String? title}) {
  return Column(
    children: [
      Container(
          width: 105.w,
          height: 105.h,
          margin: EdgeInsets.all(15.sp),
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
      Text(
        title ?? "",
        style: TextStyle(fontSize: 11.sp, color: primaryColor),
      )
    ],
  );
}
