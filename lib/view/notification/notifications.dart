import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/notification/notifications_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Notifications extends GetView<NotificationsController> {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(414, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.notificationsKey,
        body: SizedBox(
            width: width,
            height: height,
            child: Column(children: [
              const CustomPageContainer(
                  text: "الإشعارات", isDashboard: false, isFilter: false),
              notificationItem(
                  icon: Icons.check_circle_outline,
                  iconColor: Colors.green,
                  serviceId: 88351,
                  serviceStatus: "تمت الخدمة"),
              notificationItem(
                  icon: CupertinoIcons.time,
                  iconColor: Colors.orange,
                  serviceId: 88351,
                  serviceStatus: "تمت الخدمة"),
              notificationItem(
                  icon: CupertinoIcons.clear_circled,
                  iconColor: Colors.red,
                  serviceId: 88351,
                  serviceStatus: "تمت الخدمة"),
            ])),
      ),
    );
  }
}

Widget notificationItem(
    {IconData? icon, Color? iconColor, int? serviceId, String? serviceStatus}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0.sp),
            child: Icon(
              icon,
              color: iconColor,
              size: 30.sp,
            ),
          ),
          Column(
            children: [
              Text(
                "$serviceId : رقم الخدمة",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0.sp),
                child: Text(
                  "حالة الخدمة : $serviceStatus",
                  style: TextStyle(
                      fontSize: 18.sp,
                      wordSpacing: 5,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      const Divider(
        color: greyDark,
        thickness: 1,
      )
    ],
  );
}
