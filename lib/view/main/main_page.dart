import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/home/home.dart';
import 'package:repair_app/view/main/main_page_controller.dart';
import 'package:repair_app/view/main/menu.dart';
import 'package:repair_app/view/notification/notifications.dart';
import 'package:repair_app/view/profile/profile.dart';
import 'package:repair_app/view/reports/report.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainPageController());
    return GetBuilder<MainPageController>(
      builder: ((controller) {
        return ScreenUtilInit(
            designSize: const Size(414, 900),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => //
                Scaffold(
                  key: controller.mainKey,
                  bottomNavigationBar: Obx(
                    () => BottomNavigationBar(
                      backgroundColor: secondaryColor,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.white60,
                      unselectedLabelStyle: TextStyle(
                          color: greyBorder,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                      selectedLabelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                      //   onTap: controller.changeTabIndex,
                      key: controller.bottomNavigation,
                      onTap: (position) {
                        controller.tabIndex.value = position;
                        controller.pageController.jumpToPage(position);
                      },
                      currentIndex: controller.tabIndex.value,
                      type: BottomNavigationBarType.fixed,
                      items: [
                        bottomNavigationBarItem(
                          icon: CupertinoIcons.bell_fill,
                          label: "الإشعارات",
                        ),
                        bottomNavigationBarItem(
                            icon: CupertinoIcons.person_fill,
                            label: "الملف الشخصي"),
                        bottomNavigationBarItem(
                            icon: Icons.home, label: "الرئيسية"),
                        bottomNavigationBarItem(
                            icon: Icons.receipt_sharp, label: "التقارير"),
                        bottomNavigationBarItem(
                          icon: Icons.menu,
                          label: "المزيد",
                        ),
                      ],
                    ),
                  ),
                  body: SafeArea(
                    child: PageView(
                      children: const [
                        Notifications(),
                        Profile(),
                        Home(),
                        Reports(),
                        Menu(),
                      ],
                      controller: controller.pageController,
                    ),
                  ),
                ));
      }),
    );
  }

  bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(icon: Icon(icon, size: 30.sp), label: label);
  }
}
