import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/ui/report/reports/report_controller.dart';
import 'package:repair_app/ui/report/service_details/report_details.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Reports extends GetView<ReportController> {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReportController());
    final width = MediaQuery.of(context).size.width;
    return DoubleBack(
      message: "Press again BACK to exit".tr,
      background: primaryColor,
      textStyle: const TextStyle(color: Colors.white),
      child: Scaffold(
        key: controller.reportKey,
        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 200.h,
            elevation: 0,
            actions: [
              CustomPageContainer(isFilter: true, text: "services cases".tr)
            ]),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.only(top: 10.h),
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const ReportDetails(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: serviceItem(
                          color: const Color(0xffff3d3d),
                          title: "4",
                          description: "services canceled".tr),
                    ),
                    InkWell(
                      onTap: () {Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                          const ReportDetails(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );},
                      child: serviceItem(
                          color: const Color(0xffff9900),
                          title: "4",
                          description: "services in progress".tr),
                    ),
                    InkWell(
                      onTap: () {Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                          const ReportDetails(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );},
                      child: serviceItem(
                          color: const Color(0xff00935d),
                          title: "4",
                          description: "services performed".tr),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget serviceItem({Color? color, String? title, String? description}) {
    return Container(
      height: 105.h,
      width: 366.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      padding: EdgeInsets.only(top: 15.h),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title ?? "",
                  style: TextStyle(
                      fontSize: 33.w,
                      //  fontSize: key.currentContext!.size!.height*0.2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  description ?? "",
                  style: TextStyle(
                      fontSize: 20.w,
                      //  fontSize: MediaQuery.of(Get.context!).size.width*0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
