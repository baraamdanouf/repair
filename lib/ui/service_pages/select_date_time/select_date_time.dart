import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/ui/service_pages/bill/bill.dart';
import 'package:repair_app/ui/service_pages/bill/bill_controller.dart';
import 'package:repair_app/ui/service_pages/select_date_time/select_date_time_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';
import 'package:repair_app/widgets/custom_service.dart';

class SelectDateTime extends GetView<SelectDateTimeController> {
  const SelectDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SelectDateTimeController());
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: controller.selectDateTimeKey,
        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 200.h,
            elevation: 0,
            actions: [
              CustomPageContainer(
                  isService: true,
                  text: "Set a date and time for the appointment".tr)
            ]),
        body: SafeArea(
            bottom: false,
            child: Container(
                width: width,
                margin: EdgeInsets.only(top: 8.h, bottom: 35.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomService(),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    Text(
                      "Set appointments".tr,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 22.h,
                          fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Container(
                          margin: EdgeInsets.zero,
                          width: 375.w,
                          height: 80.h,
                          child: ListView.builder(
                              itemCount: controller.times.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) =>
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 23.h,
                                          child: Center(
                                              child: Text(
                                            controller.times[index],
                                            style: TextStyle(
                                                color: greyDark,
                                                fontSize: 17.h),
                                          )),
                                        ),
                                        const Divider(
                                          color: greyDark,
                                          thickness: 1,
                                        ),
                                      ])),
                        )),
                    SizedBox(
                        height: 25.h,
                        child: InkWell(
                            child: Center(
                                child: Container(
                              width: 33.w,
                              height: 30.h,
                              decoration: const BoxDecoration(
                                  color: green, shape: BoxShape.circle),
                              child: Icon(
                                Icons.add,
                                size: 25.h,
                                color: Colors.white,
                              ),
                            )),
                            onTap: () async {
                              await controller.onChangeDateTime();
                              controller.selectedDate.value = DateTime.now();
                              controller.dateTime1.value = TimeOfDay.now();
                              controller.dateTime2.value = TimeOfDay.now();
                            })),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    SizedBox(
                      child: Text(
                        "select technician".tr,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 22.h,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 7.h),
                    SizedBox(
                      width: width,
                      child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width: 125.w,
                                    height: 45.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "محمد الأحمد".tr,
                                          style: TextStyle(
                                            color: greyDark,
                                            fontSize: 20.h,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.person_solid,
                                          color: primaryColor,
                                          size: 30.w,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border:
                                            Border.all(color: greyVeryDark))),
                                Container(
                                    width: 125.w,
                                    height: 45.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "محمد الأحمد".tr,
                                          style: TextStyle(
                                            color: greyDark,
                                            fontSize: 20.h,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.person_solid,
                                          color: primaryColor,
                                          size: 30.w,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border:
                                            Border.all(color: greyVeryDark))),
                                Container(
                                    width: 125.w,
                                    height: 45.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "محمد الأحمد".tr,
                                          style: TextStyle(
                                            color: greyDark,
                                            fontSize: 20.h,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.person_solid,
                                          color: primaryColor,
                                          size: 30.w,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border:
                                            Border.all(color: greyVeryDark))),
                              ])),
                    ),
                    SizedBox(height: 7.h),
                    const Divider(color: greyDark, thickness: 1),
                    Text(
                      "cost state".tr,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 22.h,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          onPressed: () async {},
                          text: "free".tr,
                          width: 121.w,
                          backgroundColor: primaryColor,
                        ),
                        CustomButton(
                          onPressed: () async {},
                          text: "paid".tr,
                          width: 121.w,
                          backgroundColor: primaryColor,
                        ),
                        CustomButton(
                          onPressed: () async {},
                          text: "undefined".tr,
                          width: 121.w,
                          backgroundColor: primaryColor,
                        ),
                      ],
                    ),
                    Spacer(),
                    Center(
                      child: CustomButton(
                        onPressed: () async {
                          Get.delete<BillController>();
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const Bill(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        text: "send appointment".tr,
                        width: 142.83.w,
                        backgroundColor: green,
                      ),
                    ),
                  ],
                ))));
  }
}
