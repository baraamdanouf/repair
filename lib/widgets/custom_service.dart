import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/widgets/custom_text.dart';

class CustomService extends StatelessWidget {
  const CustomService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: SizedBox(
        height: 120.h,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                      text: "service category".tr,
                      fontSize: 16.h,
                      height: 22.h,
                      alignment: AlignmentDirectional.topStart,
                      bold: true,
                      textColor: primaryColor),
                  CustomText(
                      text: "air conditioning and refrigeration".tr,
                      width: 130.w,
                      fontSize: 16.h,
                      height:
                          LocalStorage.languageSelected == "en" ? 50.h : 21.h,
                      alignment: AlignmentDirectional.center,
                      textAlign: TextAlign.center,
                      textColor: greyDark),
                  SizedBox(height: 5.h),
                  CustomText(
                      text: "request number".tr,
                      width: 130.w,
                      fontSize: 16.h,
                      height: 21.h,
                      alignment: AlignmentDirectional.center,
                      textAlign: TextAlign.center,
                      bold: true,
                      textColor: primaryColor),
                  CustomText(
                      text: "9658".tr,
                      fontSize: 16.h,
                      height: 21.h,
                      alignment: AlignmentDirectional.center,
                      textColor: greyDark)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                      text: "service date".tr,
                      fontSize: 16.h,
                      height: 27.h,
                      marginBottom: 0,
                      alignment: AlignmentDirectional.topCenter,
                      bold: true,
                      textColor: primaryColor),
                  CustomText(
                      text: "13/1/2021| 4:45".tr,
                      width: 130.w,
                      fontSize: 16.h,
                      height:
                          LocalStorage.languageSelected == "en" ? 50.h : 22.h,
                      alignment: AlignmentDirectional.center,
                      textColor: greyDark),
                  SizedBox(height: 5.h),
                  CustomText(
                      text: "apartment".tr,
                      width: 130.w,
                      fontSize: 16.h,
                      height: 21.h,
                      alignment: AlignmentDirectional.center,
                      bold: true,
                      textColor: primaryColor),
                  CustomText(
                      text: "23".tr,
                      fontSize: 16.h,
                      height: 21.h,
                      alignment: AlignmentDirectional.bottomCenter,
                      textColor: greyDark)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                      text: "service category".tr,
                      fontSize: 16.h,
                      height: 22.h,
                      alignment: AlignmentDirectional.topStart,
                      bold: true,
                      textColor: primaryColor),
                  CustomText(
                      text: "the air conditioner is not cooling".tr,
                      width: 130.w,
                      fontSize: 16.h,
                      height: LocalStorage.languageSelected == "en" ? 50.h : 21.h,
                      alignment: AlignmentDirectional.center,
                      textAlign: TextAlign.center,
                      textColor: greyDark),
                  SizedBox(height: 5.h),
                  CustomText(
                      text: "building".tr,
                      width: 130.w,
                      fontSize: 16.h,
                      height: 21.h,
                      alignment: AlignmentDirectional.bottomCenter,
                      textAlign: TextAlign.center,
                      bold: true,
                      textColor: primaryColor),
                  CustomText(
                      text: "lawn tower".tr,
                      fontSize: 14.h,
                      height: 21.h,
                      alignment: AlignmentDirectional.topCenter,
                      textColor: greyDark)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
