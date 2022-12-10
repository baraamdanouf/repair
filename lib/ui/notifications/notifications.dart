import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/ui/notifications/notifications_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';
import 'package:repair_app/widgets/custom_text.dart';

class Notifications extends GetView<NotificationsController> {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return DoubleBack(
        message: "Press again BACK to exit".tr,
        background: primaryColor,
        textStyle: const TextStyle(color: Colors.white),
      child: SafeArea(
        child: Scaffold(
            key: controller.notificationsKey,
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 200.h,
              elevation: 0,
              actions: [CustomPageContainer(text: "notifications".tr)]),
            body: SafeArea(
              child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Column(children: [
                    notificationItem(
                        icon: check,
                        serviceId: 88351,
                        serviceStatus: "service done".tr),
                    notificationItem(
                        icon: inProgress,
                        serviceId: 88351,
                        serviceStatus: "waiting".tr),
                    notificationItem(
                        icon: error,
                        serviceId: 88351,
                        serviceStatus: "canceled".tr),
                  ])),
            )),
      ),
    );
  }
}

Widget notificationItem(
    {String? icon, int? serviceId, String? serviceStatus}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(
            right: LocalStorage.languageSelected == "ar" ? 11.w : 0.w,
            left: LocalStorage.languageSelected == "ar" ? 0.w : 11.w),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 195.w,
                    child: Row(
                      children: [
                        CustomText(text:"service number : ".tr, fontSize: 18.h, textColor: blue, bold: true),
                        CustomText(text: "${serviceId}", fontSize: 18.h, textColor: primaryColor, bold: true)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 195.w,
                    child: Row(
                      children: [
                        CustomText(text:"service status : ".tr, fontSize: 18.h, textColor: blue, bold: true),
                        CustomText(text: serviceStatus!, fontSize: 18.h, textColor: primaryColor, bold: true),
                      ]
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: LocalStorage.languageSelected == "ar" ? 30.w : 0.w,
                    right: LocalStorage.languageSelected == "ar" ? 0.w : 30.w),
                child:
                SvgPicture.asset(
                  icon!,
                  width: 30.w,
                  height: 30.h,
                ),
              )
            ]
          ),
        ),
      const Divider(
        color: greyDark,
        thickness: 1,
      )
    ],
  );
}
