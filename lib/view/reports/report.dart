import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/view/reports/report_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Reports extends GetView<ReportController> {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReportController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(414, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.reportKey,
        body: SizedBox(
            width: width,
            height: height,
            child: Column(children: [
              const CustomPageContainer(
                text: "حالات الخدمات",
                isFilter: true,
                isDashboard: false,
              ),
              serviceItem(
                  color: const Color(0xffff3d3d),
                  title: "4",
                  description: "خدمات تم إنجازها"),
              serviceItem(
                  color: const Color(0xffff663d),
                  title: "4",
                  description: "خدمات قيد الإنجاز"),
              serviceItem(
                  color: const Color(0xff00935d),
                  title: "4",
                  description: "خدمات تم إلغاؤها")
            ])),
      ),
    );
  }
}

Widget serviceItem({Color? color, String? title, String? description}) {
  return Column(
    children: [
      Container(
          width: 366.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          //   color: color,
          margin: EdgeInsets.all(15.sp),
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                    fontSize: 41.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                description ?? "",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    ],
  );
}
