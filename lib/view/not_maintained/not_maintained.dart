import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/not_maintained/not_maintained_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class NotMaintained extends GetView<NotMaintainedController> {
  const NotMaintained({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotMaintainedController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.notMaintainedKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "not maintained".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: false,
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: KeyboardVisibilityBuilder(
            builder: (context, visible) => Container(
                width: width,
                height: visible ? 850.h : 580.h,
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
                            "select the reason".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight:
                                    LocalStorage.languageSelected == "ar"
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                fontSize: 21.h,
                                color: primaryColor),
                          ),
                          SizedBox(
                            height: 27.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25.h,
                                  child: Transform.scale(
                                    scale: 1.2,
                                    child: Obx(
                                      () => Radio(
                                        onChanged: (value) {
                                          controller.onChangeReason(value);
                                        },
                                        value: 0,
                                        groupValue:
                                            controller.selectedReason.value,
                                        fillColor: MaterialStateProperty.all(
                                            primaryColor),
                                        activeColor: primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "the tenant is not at home".tr,
                                  style: TextStyle(
                                      color: greyDark, fontSize: 18.h),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25.h,
                                  child: Transform.scale(
                                    scale: 1.2,
                                    child: Obx(
                                      () => Radio(
                                        onChanged: (value) {
                                          controller.onChangeReason(value);
                                        },
                                        value: 1,
                                        groupValue:
                                            controller.selectedReason.value,
                                        fillColor: MaterialStateProperty.all(
                                            primaryColor),
                                        activeColor: primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "we need materials".tr,
                                  style: TextStyle(
                                      color: greyDark, fontSize: 18.h),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25.h,
                                  child: Transform.scale(
                                    scale: 1.2,
                                    child: Obx(
                                      () => Radio(
                                        onChanged: (value) {
                                          controller.onChangeReason(value);
                                        },
                                        value: 2,
                                        groupValue:
                                            controller.selectedReason.value,
                                        fillColor: MaterialStateProperty.all(
                                            primaryColor),
                                        activeColor: primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "other".tr,
                                  style: TextStyle(
                                      color: greyDark, fontSize: 18.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomEditText(
                        width: 375.w,
                        inputType: TextInputType.multiline,
                        labelText: "description of reason".tr,
                        hintText: "write a detailed explanation".tr,
                        textEditingController: controller.descriptionController,
                        lines: 1),
                    SizedBox(height: 5.h),
                    Text(
                      "attach photos of the problem".tr,
                      style: TextStyle(
                          fontWeight: LocalStorage.languageSelected == "ar"
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontSize: 21.h,
                          color: primaryColor),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 375.w,
                      child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 85.w,
                                    height: 85.h,
                                    child: Image.asset(
                                      mobile,
                                      width: 70.w,
                                      height: 70.h,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border:
                                            Border.all(color: greyVeryDark))),
                                Container(
                                    width: 85.w,
                                    height: 85.h,
                                    child: Image.asset(
                                      mobile,
                                      width: 70.w,
                                      height: 70.h,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border:
                                            Border.all(color: greyVeryDark))),
                                Container(
                                    width: 85.w,
                                    height: 85.h,
                                    child: Image.asset(
                                      mobile,
                                      width: 70.w,
                                      height: 70.h,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border:
                                            Border.all(color: greyVeryDark))),
                                Container(
                                    width: 85.w,
                                    height: 85.h,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          child: Icon(
                                            Icons.camera_alt,
                                            size: 65.w,
                                            color: primaryColor,
                                          ),
                                          height: 66.h,
                                        ),
                                        SizedBox(
                                          child: Text(
                                            "photo shoot".tr,
                                            style: TextStyle(
                                                fontSize: 11.h,
                                                color: greyDark),
                                          ),
                                          height: 15.h,
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border:
                                            Border.all(color: greyVeryDark))),
                              ])),
                    ),
                    visible
                        ? SizedBox(
                            height: 20.h,
                          )
                        : const Spacer(),
                    Center(
                      child: CustomButton(
                        onPressed: () async {},
                        text: "send".tr,
                        width: 142.83.w,
                        backgroundColor: green,
                      ),
                    ),
                  ],
                )),
          ),
        ),
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
