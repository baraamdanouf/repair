import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/view/service_details/service_details_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class ServiceDetails extends GetView<ServiceDetailsController> {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ServiceDetailsController());

    final width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.serviceDetailsKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 250.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "services cases".tr,
              isDashboard: false,
              isDashboardIcons: true,
              isDrawer: false,
            )
          ],
        ),
        body:  Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              width: width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                  itemBuilder: (BuildContext context, int index) =>
                      serviceItem())),
        ),
    );
  }

  Widget serviceItem({Color? color, String? title, String? description}) {
    return Container(
        height: 190.h,
        width: 390.w,
        padding: EdgeInsets.only(bottom: 5.h),
        child: Card(
          // margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
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
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      width: 60.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(7.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        airConditioner,
                        width: 42.w,
                        height: 42.h,
                      ),
                    ),
                    Text(
                      "service category".tr + " : ",
                      style: TextStyle(fontSize: 13.w),
                    ),
                    Text(
                      "air conditioning \nand refrigeration".tr,
                      style: TextStyle(color: primaryColor, fontSize: 13.w),
                    ),
                    Text(
                      "   |   ".tr + "problem".tr + " : ",
                      style: TextStyle(fontSize: 13.w),
                    ),
                    Text(
                      "the air conditioner is not cooling".tr,
                      style: TextStyle(color: primaryColor, fontSize: 13.w),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("#",
                            style: TextStyle(
                                fontSize: 27.w,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "request number".tr,
                          style: const TextStyle(color: greyDark),
                        ),
                        const Text(
                          "94974",
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          color: Colors.black,
                          size: 27.w,
                        ),
                        Text(
                          "request number".tr,
                          style: const TextStyle(color: greyDark),
                        ),
                        const Text(
                          "13/1/2021 | 4:45",
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          color: Colors.black,
                          size: 27.w,
                        ),
                        Text(
                          "address".tr,
                          style: const TextStyle(color: greyDark),
                        ),
                        const Text(
                          "لاون تاون - شقة23",
                          style: TextStyle(color: primaryColor),
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
