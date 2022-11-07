import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/rating/rating.dart';
import 'package:repair_app/view/set_appoinment/set_oppoinment_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Appointment extends GetView<AppointmentController> {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppointmentController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.appointmentKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "set of appointment".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: false,
            )
          ],
        ),
        body: Container(
            width: width,
            height: height,
            margin: EdgeInsets.only(top: 10.h, bottom: 36.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                serviceRequestItem(),
                const Divider(
                  color: greyDark,
                  thickness: 1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 27.w),
                  child: Column(
                    children: [
                      Text(
                        "please choose the appropriate date for you".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: LocalStorage.languageSelected == "ar"
                                ? FontWeight.bold
                                : FontWeight.w500,
                            fontSize: 26.h,
                            color: primaryColor),
                      ),
                      SizedBox(
                        height: 27.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25.h,
                              child: Transform.scale(
                                scale: 1.2,
                                child: Obx(
                                  () => Radio(
                                    onChanged: (value) {
                                      controller.onChangeService(value);
                                    },
                                    value: 0,
                                    groupValue: controller.selectedService.value,
                                    fillColor:
                                        MaterialStateProperty.all(primaryColor),
                                    activeColor: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "4 كانون الثاني2000 | من 10:14 إلى 10:14 ",
                              style: TextStyle(color: greyDark, fontSize: 18.h),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: greyDark,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 27.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25.h,
                              child: Transform.scale(
                                scale: 1.2,
                                child: Obx(
                                  () => Radio(
                                    onChanged: (value) {
                                      controller.onChangeService(value);
                                    },
                                    value: 1,
                                    groupValue: controller.selectedService.value,
                                    fillColor:
                                        MaterialStateProperty.all(primaryColor),
                                    activeColor: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "4 كانون الثاني2000 | من 10:14 إلى 10:14 ",
                              style: TextStyle(color: greyDark, fontSize: 18.h),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: greyDark,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 27.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25.h,
                              child: Transform.scale(
                                scale: 1.2,
                                child: Obx(
                                  () => Radio(
                                    onChanged: (value) {
                                      controller.onChangeService(value);
                                    },
                                    value: 2,
                                    groupValue:
                                        controller.selectedService.value,
                                    fillColor:
                                        MaterialStateProperty.all(primaryColor),
                                    activeColor: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "4 كانون الثاني2000 | من 10:14 إلى 10:14 ",
                              style: TextStyle(color: greyDark, fontSize: 18.h),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Divider(
                  color: greyDark,
                  thickness: 1,
                ),
                SizedBox(
                  height: 38.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "cost : ".tr,
                        style: TextStyle(
                            fontWeight: LocalStorage.languageSelected == "ar"
                                ? FontWeight.bold
                                : FontWeight.w500,
                            fontSize: 26.h,
                            color: primaryColor),
                      ),
                      Text(
                        "free".tr,
                        style: TextStyle(fontSize: 18.h, color: greyDark),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 38.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "cost : ".tr,
                        style: TextStyle(
                            fontWeight: LocalStorage.languageSelected == "ar"
                                ? FontWeight.bold
                                : FontWeight.w500,
                            fontSize: 26.h,
                            color: primaryColor),
                      ),
                      Text(
                        "350 د.أ".tr,
                        style: TextStyle(fontSize: 18.h, color: greyDark),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: greyDark,
                  thickness: 1,
                ),
                SizedBox(
                  height: 35.h,
                  child: Text(
                    "choose your payment method".tr,
                    style: TextStyle(
                        fontWeight: LocalStorage.languageSelected == "ar"
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontSize: 26.h,
                        color: primaryColor),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 40.h,
                          width: 25.w,
                          child: Transform.scale(
                              scale: 1,
                              child: Obx(
                                () => Radio(
                                  onChanged: (value) {
                                    controller.onChangePayment(value);
                                  },
                                  value: 0,
                                  groupValue: controller.selectedPayment.value,
                                  fillColor:
                                      MaterialStateProperty.all(primaryColor),
                                  activeColor: primaryColor,
                                ),
                              ))),
                      SizedBox(
                        width: 50.w,
                        child: Text("cash".tr,
                            style: TextStyle(
                              color: greyDark,
                              fontSize: 18.h,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          height: 40.h,
                          width: 25.w,
                          child: Transform.scale(
                              scale: 1,
                              child: Obx(
                                () => Radio(
                                  onChanged: (value) {
                                    controller.onChangePayment(value);
                                  },
                                  value: 1,
                                  groupValue: controller.selectedPayment.value,
                                  fillColor:
                                      MaterialStateProperty.all(primaryColor),
                                  activeColor: primaryColor,
                                ),
                              ))),
                      Text("bank card".tr,
                          style: TextStyle(
                            color: greyDark,
                            fontSize: 18.h,
                          ))
                    ],
                  ),
                ]),
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                          //    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServiceRequest()));
                        },
                        text: "cancel order".tr,
                        width: 142.83.w,
                        backgroundColor: red,
                      ),
                      CustomButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Rating()));
                          await Get.dialog(AlertDialog(
                            backgroundColor: greenWhite,
                            content: Container(
                              height: 175.h,
                              width: 325.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(check),
                                  Text(
                                    "completed successfully".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.h, color: primaryColor),
                                  )
                                ],
                              ),
                            ),
                          ));
                        },
                        text: "appointment confirm".tr,
                        width: 142.83.w,
                        backgroundColor: green,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget serviceRequestItem() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "service category".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.h,
                      color: primaryColor,
                      fontWeight: LocalStorage.languageSelected == "ar"
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
                Text(
                  "air conditioning \nand refrigeration".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.h, color: greyDark),
                ),
                Text(
                  "request number".tr,
                  //    textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.h,
                      color: primaryColor,
                      height: 1.5,
                      fontWeight: LocalStorage.languageSelected == "ar"
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
                Text(
                  "94974",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.h,
                      color: greyDark,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "service date".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.h,
                      color: primaryColor,
                      fontWeight: LocalStorage.languageSelected == "ar"
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
                Text(
                  "13/1/2021 | 4:45",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 15.h, height: 1.8, color: greyDark),
                ),
                Text(
                  "apartment".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18.h,
                      color: primaryColor,
                      fontWeight: LocalStorage.languageSelected == "ar"
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
                Text(
                  "23",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.h, color: greyDark),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "service category".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.h,
                      color: primaryColor,
                      fontWeight: LocalStorage.languageSelected == "ar"
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
                Text(
                  "the air conditioner is not cooling".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.h, color: greyDark),
                ),
                Text(
                  "building".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18.h,
                      color: primaryColor,
                      fontWeight: LocalStorage.languageSelected == "ar"
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
                Text(
                  "lawn tower".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.h,
                      color: greyDark,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
        ));
  }
}
