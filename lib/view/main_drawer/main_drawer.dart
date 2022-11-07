import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/conditioning/conditioning.dart';
import 'package:repair_app/view/contract/contract.dart';
import 'package:repair_app/view/contracts/contracts.dart';
import 'package:repair_app/view/home/home.dart';
import 'package:repair_app/view/main_drawer/main_drawer_controller.dart';
import 'package:repair_app/view/notifications/notifications.dart';
import 'package:repair_app/view/payments/payments.dart';
import 'package:repair_app/view/plumbing/plumbing.dart';
import 'package:repair_app/view/profile/profile.dart';
import 'package:repair_app/view/reports/report.dart';
import 'package:repair_app/view/service_details/service_details.dart';

class MainDrawer extends GetView<MainDrawerController> {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainDrawerController());
    final screens = [
      const Notifications(),
      const Profile(),
      Navigator(
        key: controller.RIKey1,
        onGenerateRoute: (settings) {
          Widget page = const Home();
          if (settings.name == 'condition') {
            page = const Conditioning();
          } else if (settings.name == 'plumbing') {
            page = const Plumbing();
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
      Navigator(
        key: controller.RIKey2,
        onGenerateRoute: (settings) {
          Widget page = const Reports();
          if (settings.name == 'report') {
            page = const ServiceDetails();
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
      Navigator(
        key: controller.RIKey3,
        onGenerateRoute: (settings) {
          Widget page = const Contracts();
          if (settings.name == 'contract') {
            page = const Contract();
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    ];
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.mainKey1,
        bottomNavigationBar: Obx(
          () => Directionality(
            textDirection: LocalStorage.languageSelected == "ar"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: Container(
              height: 75.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              color: secondaryColor,
              child: BottomAppBar(
                elevation: 0,
                color: Colors.transparent,
                child: SizedBox(
                  height: 70.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonBar(
                          text: 'notifications'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 0;
                          },
                          selected: controller.selectedIndex == 0,
                          iconData: Icons.notifications,
                        ),
                        IconButtonBar(
                          text: 'profile'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 1;
                          },
                          selected: controller.selectedIndex == 1,
                          iconData: Icons.person,
                        ),
                        IconButtonBar(
                          text: 'home'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 2;
                          },
                          selected: controller.selectedIndex == 2,
                          iconData: Icons.home,
                        ),
                        IconButtonBar(
                          text: 'reports'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 3;
                          },
                          selected: controller.selectedIndex == 3,
                          iconData: Icons.description,
                        ),
                        IconButtonBar(
                          text: 'more'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 4;
                          },
                          selected: controller.selectedIndex == 4,
                          iconData: Icons.menu,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: screens,
          ),
        ),
      ),
    );
  }
}
class MainDrawer2 extends GetView<MainDrawerController> {
  const MainDrawer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainDrawerController());
    final screens = [
      const Notifications(),
      const Profile(),
      Navigator(
        key: controller.RIKey1,
        onGenerateRoute: (settings) {
          Widget page = const Home();
          if (settings.name == 'condition') {
            page = const Conditioning();
          } else if (settings.name == 'plumbing') {
            page = const Plumbing();
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
      Navigator(
        key: controller.RIKey2,
        onGenerateRoute: (settings) {
          Widget page = const Reports();
          if (settings.name == 'report') {
            page = const ServiceDetails();
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
      Navigator(
        key: controller.RIKey3,
        onGenerateRoute: (settings) {
          Widget page = const Payments();
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    ];
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.mainKey2,
        bottomNavigationBar: Obx(
              () => Directionality(
            textDirection: LocalStorage.languageSelected == "ar"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: Container(
              height: 75.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              color: secondaryColor,
              child: BottomAppBar(
                elevation: 0,
                color: Colors.transparent,
                child: SizedBox(
                  height: 70.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonBar(
                          text: 'notifications'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 0;
                          },
                          selected: controller.selectedIndex == 0,
                          iconData: Icons.notifications,
                        ),
                        IconButtonBar(
                          text: 'profile'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 1;
                          },
                          selected: controller.selectedIndex == 1,
                          iconData: Icons.person,
                        ),
                        IconButtonBar(
                          text: 'home'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 2;
                          },
                          selected: controller.selectedIndex == 2,
                          iconData: Icons.home,
                        ),
                        IconButtonBar(
                          text: 'reports'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 3;
                          },
                          selected: controller.selectedIndex == 3,
                          iconData: Icons.description,
                        ),
                        IconButtonBar(
                          text: 'more'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 4;
                          },
                          selected: controller.selectedIndex == 4,
                          iconData: Icons.menu,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Obx(
              () => IndexedStack(
            index: controller.selectedIndex.value,
            children: screens,
          ),
        ),
      ),
    );
  }
}
class IconButtonBar extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool selected;
  final Function() onPressed;

  const IconButtonBar(
      {Key? key,
      required this.text,
      required this.iconData,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          selected
              ? Stack(children: [
                  Positioned(
                    child: Center(
                      child: Transform.translate(
                          offset: const Offset(
                            0,
                            (1 - 20) * 1,
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              iconData,
                              size: 40.w,
                              color: blueLite,
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                    const CircleBorder()),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.only(
                                        top: 14.h,
                                        bottom: 18.h,
                                        left: 20.w,
                                        right: 20.w)),
                                backgroundColor:
                                    MaterialStateProperty.all(secondaryColor)),
                          )),
                    ),
                  ),
                ])
              : Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        iconData,
                        size: 35.w,
                        color: Colors.white,
                      )),
                ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12.h,
                height: selected ? -3.3.h : -0.001.h,
                color: selected ? blueLite : Colors.white),
          )
        ],
      ),
    );
  }
}
