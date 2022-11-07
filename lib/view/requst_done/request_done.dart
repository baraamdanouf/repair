import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/requst_done/request_done_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class DoneRequest extends GetView<DoneRequestController> {
  const DoneRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DoneRequestController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.doneRequestKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "done request".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: false,
            )
          ],
        ),
        body: Container(
            width: width,
            height: height,
            margin: EdgeInsets.only(top: 10.h, bottom: 70.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                serviceRequestItem(),
                const Divider(
                  color: greyDark,
                  thickness: 1,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomEditText(
                    width: 375.w,
                    inputType: TextInputType.multiline,
                    labelText: "problem".tr,
                    hintText: "write your notes".tr,
                    textEditingController: controller.problemController,
                    lines: 1
                ),
                SizedBox(height: 20.h),
                Text(
                  "attach photos of the process".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21.h,
                      color: primaryColor
                  ),
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
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: greyVeryDark))),
                            Container(
                                width: 85.w,
                                height: 85.h,
                                child: Image.asset(
                                  mobile,
                                  width: 70.w,
                                  height: 70.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: greyVeryDark))),
                            Container(
                                width: 85.w,
                                height: 85.h,
                                child: Image.asset(
                                  mobile,
                                  width: 70.w,
                                  height: 70.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: greyVeryDark))),
                            Container(
                                width: 85.w,
                                height: 85.h,
                                child:
                                Column(
                                  children: [
                                    SizedBox(
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 65.w,
                                        color: primaryColor,
                                      ),
                                      height: 66.h,
                                    ),
                                    SizedBox(child: Text("photo shoot".tr, style: TextStyle(
                                      fontSize: 11.h,
                                      color: greyDark
                                    ),), height: 15.h,)
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: greyVeryDark))),
                          ])),
                ),
                const Spacer(),
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
