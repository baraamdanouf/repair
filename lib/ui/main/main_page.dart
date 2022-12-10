import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/ui/drawer_pages/contract/contract.dart';
import 'package:repair_app/ui/drawer_pages/contracts/contracts.dart';
import 'package:repair_app/ui/drawer_pages/payments/payments.dart';
import 'package:repair_app/ui/home/home.dart';
import 'package:repair_app/ui/main/main_page_controller.dart';
import 'package:repair_app/ui/notifications/notifications.dart';
import 'package:repair_app/ui/profile/profile.dart';
import 'package:repair_app/ui/report/reports/report.dart';
import 'package:repair_app/ui/report/service_details/report_details.dart';
import 'package:repair_app/ui/services/conditioning/conditioning.dart';
import 'package:repair_app/ui/services/plumbing/plumbing.dart';
import 'package:repair_app/widgets/custom_logo_container.dart';
import 'package:repair_app/widgets/custom_text.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainPageController());
    final screens = [
      WillPopScope(
        child: Navigator(
          key: controller.navKeyNotifications,
          onGenerateRoute: (settings) {
            Widget page = const Notifications();
            return MaterialPageRoute(builder: (_) => page);
          },
        ),
        onWillPop: () async {
          if (controller.mainKey.currentState!.isDrawerOpen) {
            controller.mainKey.currentState!.closeDrawer();
            return false;
          }
          return !await controller.navKeyNotifications.currentState!.maybePop();
        },
      ),
      WillPopScope(
        child: Navigator(
          key: controller.navKeyProfile,
          onGenerateRoute: (settings) {
            Widget page = const Profile();
            return MaterialPageRoute(builder: (_) => page);
          },
        ),
        onWillPop: () async {
          if (controller.mainKey.currentState!.isDrawerOpen) {
            controller.mainKey.currentState!.closeDrawer();
            return false;
          }
          return !await controller.navKeyProfile.currentState!.maybePop();
        },
      ),
      WillPopScope(
        onWillPop: () async {
          if (controller.mainKey.currentState!.isDrawerOpen) {
            controller.mainKey.currentState!.closeDrawer();
            return false;
          }
          return !await controller.navKeyHome.currentState!.maybePop();
        },
        child: Navigator(
          key: controller.navKeyHome,
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
      ),
      WillPopScope(
        onWillPop: () async {
          if (controller.mainKey.currentState!.isDrawerOpen) {
            controller.mainKey.currentState!.closeDrawer();
            return false;
          }
          return !await controller.navKeyReports.currentState!.maybePop();
        },
        child: Navigator(
          key: controller.navKeyReports,
          onGenerateRoute: (settings) {
            Widget page = const Reports();
            if (settings.name == 'report') {
              page = const ReportDetails();
            }
            return MaterialPageRoute(builder: (_) => page);
          },
        ),
      ),
      WillPopScope(
          onWillPop: () async {
            if (controller.mainKey.currentState!.isDrawerOpen) {
              controller.mainKey.currentState!.closeDrawer();
              return false;
            }
            return !await controller.navKeyContracts.currentState!.maybePop();
          },
          child: Navigator(
            key: controller.navKeyContracts,
            onGenerateRoute: (settings) {
              Widget page = const Contracts();
              if (settings.name == 'contract') {
                page = const Contract();
              }
              return MaterialPageRoute(builder: (_) => page);
            },
          )),
      WillPopScope(
          onWillPop: () async {
            if (controller.mainKey.currentState!.isDrawerOpen) {
              controller.mainKey.currentState!.closeDrawer();
              return false;
            }
            return !await controller.navKeyPayments.currentState!.maybePop();
          },
          child: Navigator(
            key: controller.navKeyPayments,
            onGenerateRoute: (settings) {
              Widget page = const Payments();
              return MaterialPageRoute(builder: (_) => page);
            },
          )),
    ];
    return Scaffold(
      key: controller.mainKey,
      bottomNavigationBar: Obx(
        () => Directionality(
          textDirection: LocalStorage.languageSelected == "ar"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            color: secondaryColor,
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: <Widget>[
                        IconButtonBar(
                          text: 'notifications'.tr,
                          onPressed: () {
                            controller.selectedIndex.value = 0;
                            controller.pageController.jumpToPage(0);
                          },
                          selected: controller.selectedIndex.value == 0,
                          iconData: Icons.notifications,
                        ),
                        Positioned(
                          right: controller.selectedIndex.value == 0 ? 15 : 2,
                          top: controller.selectedIndex.value == 0 ? 0 : 10,
                          left: controller.selectedIndex.value == 0 ? 35 : 22,
                          child: Container(
                              width: 19.w,
                              height: 19.h,
                              decoration: const BoxDecoration(
                                  color: red, shape: BoxShape.circle),
                              child: CustomText(
                                  text: "9",
                                  fontSize: 14.h,
                                  textColor: Colors.white,
                                  textAlign: TextAlign.center,
                                  marginBottom: 2.h,
                                  alignment: AlignmentDirectional.center,
                                  bold: true)),
                        )
                      ],
                    ),
                    IconButtonBar(
                      text: 'profile'.tr,
                      onPressed: () {
                        controller.selectedIndex.value = 1;
                        controller.pageController.jumpToPage(1);
                      },
                      selected: controller.selectedIndex.value == 1,
                      iconData: Icons.person,
                    ),
                    IconButtonBar(
                      text: 'home'.tr,
                      onPressed: () {
                        controller.selectedIndex.value = 2;
                        controller.pageController.jumpToPage(2);
                      },
                      selected: controller.selectedIndex.value == 2,
                      iconData: Icons.home,
                    ),
                    IconButtonBar(
                      text: 'reports'.tr,
                      onPressed: () {
                        controller.selectedIndex.value = 3;
                        controller.pageController.jumpToPage(3);
                      },
                      selected: controller.selectedIndex.value == 3,
                      iconData: Icons.description,
                    ),
                    Obx(
                      () => IconButtonBar(
                        text: 'more'.tr,
                        onPressed: () {
                          controller.mainKey.currentState!.openDrawer();
                        },
                        selected: controller.selectedIndex.value == 4,
                        iconData: Icons.menu,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: PageView(
          physics: const ScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          children: screens,
          controller: controller.pageController,
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 75.h),
              child: Center(
                child: SvgPicture.asset(
                  imgLogoBlue,
                  // height: 50.h,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            CustomText(
                text: "client name".tr,
                fontSize: 18.h,
                textColor: primaryColor,
                bold: true,
                marginTop: 2.h,
                alignment: AlignmentDirectional.center),
            SizedBox(
              height: 50.h,
            ),
            menuItem(
                img: global, title: "select language".tr, isLanguage: true),
            menuItem(
                img: password, title: "change password".tr, isLanguage: false),
            menuItem(img: aboutApp, title: "about app".tr, isLanguage: false),
            menuItem(img: rate, title: "app rating".tr, isLanguage: false),
            menuItem(
                img: insurance, title: "privacy policy".tr, isLanguage: false),
            menuItem(
                isLanguage: false,
                img: checkList,
                title: "contracts".tr,
                onTap: () async {
                  controller.selectedIndex.value = 2;
                  controller.pageController.jumpToPage(4);
                  Navigator.pop(context);
                }),
            menuItem(
                img: payment,
                title: "payments".tr,
                isLanguage: false,
                onTap: () async {
                  controller.selectedIndex.value = 2;
                  controller.pageController.jumpToPage(5);
                  Navigator.pop(context);
                }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: "development by: ".tr,
                    fontSize: 14.h,
                    textColor: primaryColor,
                    bold: true),
                CustomText(
                    text: "Why Not Tech",
                    fontSize: 14.h,
                    textColor: Colors.orange,
                    marginBottom: 2.h,
                    bold: true)
              ],
            ),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    );
  }

  Widget menuItem(
      {String? img,
      String? title,
      GestureTapCallback? onTap,
      bool? isLanguage}) {
    final controllerDropdown = Get.put(DropdownController());
    return Column(children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
              left: LocalStorage.languageSelected == "ar" ? 55.w : 0,
              right: LocalStorage.languageSelected == "ar" ? 0.w : 55.w),
          height: isLanguage! ? 45.h : 27.h,
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SvgPicture.asset(img ?? "", width: 20.w, height: 20.h)),
            CustomText(
                text: title ?? "",
                fontSize: 15.h,
                textColor: primaryColor,
                alignment: AlignmentDirectional.bottomCenter,
                textAlign: TextAlign.center,
                bold: true),
            const Spacer(),
            Visibility(
              visible: isLanguage,
              child: Obx(
                () => Directionality(
                  textDirection: TextDirection.ltr,
                  child: DropdownButton(
                    items: [
                      DropdownMenuItem(
                          child: Center(
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(17.r),
                                child: Image.asset(
                                  'icons/flags/png/ae.png',
                                  package: 'country_icons',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          value: "ar"),
                      DropdownMenuItem(
                        child: Center(
                          child: ClipOval(
                              child: SizedBox.fromSize(
                                  size: Size.fromRadius(17.r),
                                  child: Image.asset(
                                    'icons/flags/png/us.png',
                                    package: 'country_icons',
                                    fit: BoxFit.fill,
                                  ))),
                        ),
                        value: "en",
                      ),
                      DropdownMenuItem(
                        child: Center(
                          child: ClipOval(
                              child: SizedBox.fromSize(
                                  size: Size.fromRadius(17.r),
                                  child: Image.asset(
                                    'icons/flags/png/fr.png',
                                    package: 'country_icons',
                                    fit: BoxFit.fill,
                                  ))),
                        ),
                        value: "fr",
                      ),
                    ],
                    onChanged: (value) async {
                      controllerDropdown.onSelected(value as String);
                    },
                    value: controllerDropdown.selectedValue!.value,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconEnabledColor: secondaryColor,
                    underline: Container(),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      const Divider(
        color: greyDrawer,
        thickness: 1,
      ),
    ]);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        selected
            ? Stack(children: [
                Positioned(
                  child: Center(
                      child: Transform.translate(
                    offset: const Offset(0, (0 - 15) * 1),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 0.h),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Center(
                          child: Icon(iconData, size: 35.w, color: blueLite),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape:
                                MaterialStateProperty.all(const CircleBorder()),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h)),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor)),
                      ),
                    ),
                  )),
                ),
              ])
            : SizedBox(
                height: 40.h,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: IconButton(
                      onPressed: onPressed,
                      icon: Center(
                        child: Icon(iconData, size: 28.w, color: Colors.white),
                      )),
                ),
              ),
        SizedBox(
          child: CustomText(
            text: text,
            fontSize: 14.h,
            textColor: selected ? blueLite : Colors.white,
            bold: true,
            alignment: AlignmentDirectional.bottomCenter,
            heightText: selected ? -2.h : -0.0001.h,
          ),
        )
      ],
    );
  }
}
