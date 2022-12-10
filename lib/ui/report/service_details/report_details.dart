import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/ui/report/service_details/report_details_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';
import 'package:repair_app/widgets/custom_service.dart';

class ReportDetails extends GetView<ReportDetailsController> {
  const ReportDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReportDetailsController());
    final width = MediaQuery.of(context).size.width;
    var role = LocalStorage.roleSelected;
    return Scaffold(
      key: controller.reportDetailsKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 250.h,
        elevation: 0,
        actions: [
          CustomPageContainer(
              isDashboard: role == 2 ? false : true,
              text: "services cases".tr,
              role: role,
              isDashboardIcons: role == 2 ? true : false)],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              SizedBox(
                  width: width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          role == 2
                              ? serviceItem()
                              : Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    CustomService(),
                                    SizedBox(
                                      child: Divider(
                                        color: greyDark,
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                ))),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceItem({Color? color, String? title, String? description}) {
    return Container(
        height: 190.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 5.sp,
          shadowColor: primaryColor,
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(7.0.r)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: LocalStorage.languageSelected == "ar" ? 0 : 8.w,
                          top: 10.h,
                          right: LocalStorage.languageSelected == "ar"
                              ? 8.w
                              : 0.w),
                      width: 55.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(7.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        airConditioner,
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                    SizedBox(
                      width: 58.w,
                      child: Text(
                        "service category".tr,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(fontSize: 13.w),
                      ),
                    ),
                    Text(
                      " : ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 13.w),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        "air conditioning and refrigeration".tr,
                        textAlign: LocalStorage.languageSelected == "ar"
                            ? TextAlign.start
                            : TextAlign.center,
                        style: TextStyle(color: primaryColor, fontSize: 13.w),
                        maxLines: 3,
                      ),
                    ),
                    Text(
                      " | ",
                      style: TextStyle(fontSize: 13.w),
                    ),
                    Text(
                      "problem".tr + "  : ",
                      maxLines: 1,
                      style: TextStyle(fontSize: 13.w),
                    ),
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        "the air conditioner is not cooling".tr,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        style: TextStyle(color: primaryColor, fontSize: 13.w),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("#",
                            style: TextStyle(
                                fontSize: 22.w,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 120.w,
                          height: 27.h,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "request number".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.h, color: greyDark),
                            ),
                          ),
                        ),
                        Text(
                          "94974",
                          //   textAlign: TextAlign.center,
                          style: TextStyle(color: primaryColor, fontSize: 16.h),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          color: Colors.black,
                          size: 27.w,
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 27.h,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "request date".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.h, color: greyDark),
                            ),
                          ),
                        ),
                        Text(
                          "13/1/2021| 4:45",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: primaryColor, fontSize: 16.h),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          color: Colors.black,
                          size: 30.w,
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 25.h,
                          child: Align(
                            child: Text(
                              "address".tr,
                              style: TextStyle(fontSize: 16.h, color: greyDark),
                            ),
                          ),
                        ),
                        Text(
                          "lawn tower".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: primaryColor, fontSize: 14.h),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
