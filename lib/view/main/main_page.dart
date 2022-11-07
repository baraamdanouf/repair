import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/conditioning/conditioning.dart';
import 'package:repair_app/view/home/home.dart';
import 'package:repair_app/view/main/main_page_controller.dart';
import 'package:repair_app/view/main_drawer/main_drawer.dart';
import 'package:repair_app/view/notifications/notifications.dart';
import 'package:repair_app/view/plumbing/plumbing.dart';
import 'package:repair_app/view/profile/profile.dart';
import 'package:repair_app/view/report_supervisor/report_supervisor.dart';
import 'package:repair_app/view/reports/report.dart';
import 'package:repair_app/view/service_details/service_details.dart';
import 'package:repair_app/view/service_request/service_request.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainPageController());
    const int role = 0;
    final screens = [
      const Notifications(),
      const Profile(),
      Navigator(
        key: controller.RIKey1,
        onGenerateRoute: (settings) {
          Widget page =  const Home();
          if (settings.name == 'condition') {
            page = const Conditioning();
          } else if (settings.name == 'plumbing') {
            page = const Plumbing();
          }
          else if (settings.name == 'service_request') {
            page = const ServiceRequest();
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
      //  const Reports(),
      Navigator(
        key: controller.RIKey2,
        onGenerateRoute: (settings) {
          Widget page = const Reports();
          if (settings.name == 'report') {
            page = const ServiceDetails();
          }
          else if(settings.name == "report_visor")
            {
              page = const ReportSupervisor();
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
        key: controller.mainKey,
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
                            controller.mainKey.currentState!.openDrawer();
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
              Text(
                "client name".tr,
                style: TextStyle(
                  color: primaryColor,
                  height: 2.h,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              menuItem(
                  img: global, title: "select language".tr, isLanguage: true),
              menuItem(
                  img: password,
                  title: "change password".tr,
                  isLanguage: false),
              menuItem(img: aboutApp, title: "about app".tr, isLanguage: false),
              menuItem(img: rate, title: "app rating".tr, isLanguage: false),
              menuItem(
                  img: insurance,
                  title: "privacy policy".tr,
                  isLanguage: false),
              menuItem(
                  isLanguage: false,
                  img: checkList,
                  title: "contracts".tr,
                  onTap: () {
           //  Navigator.pushNamed(context, 'x');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MainDrawer()));
                  }),
              menuItem(
                  img: payment,
                  title: "payments".tr,
                  isLanguage: false,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MainDrawer2()));
                  }),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "development by: ".tr,
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 14.h,
                        height:
                            LocalStorage.languageSelected == "ar" ? 2.h : 0.h,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Why Not Tech".tr,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14.h,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 30.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(
      {String? img,
      String? title,
      GestureTapCallback? onTap,
      bool? isLanguage}) {
    return Column(children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
              left: LocalStorage.languageSelected == "ar" ? 55.w : 0,
              right: LocalStorage.languageSelected == "ar" ? 0.w : 55.w),
          height: isLanguage! ? 33.h : 27.h,
          child: Row(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SvgPicture.asset(
                img ?? "",
                width: 20.w,
                height: 20.h,
              ),
            ),
            Text(
              title ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  fontSize: 15.h),
            ),
            //   SizedBox(width: 75.w,),
            Spacer(),
            Visibility(
              visible: isLanguage,
              child: Obx(
                () => SizedBox(
                  height: 33.h,
                  width: 40.w,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(20.r),
                              child: Image.asset(
                                'icons/flags/png/ae.png',
                                package: 'country_icons',
                                width: 10.w,
                                height: 10.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          value: "ar",
                        ),
                        DropdownMenuItem(
                          child: ClipOval(
                              child: SizedBox.fromSize(
                                  size: Size.fromRadius(20.r),
                                  child: Image.asset(
                                    'icons/flags/png/us.png',
                                    package: 'country_icons',
                                    width: 10.w,
                                    height: 10.h,
                                    fit: BoxFit.fill,
                                  ))),
                          value: "en",
                        ),
                        DropdownMenuItem(
                          child: ClipOval(
                              child: SizedBox.fromSize(
                                  size: Size.fromRadius(20.r),
                                  child: Image.asset(
                                    'icons/flags/png/fr.png',
                                    package: 'country_icons',
                                    width: 10.w,
                                    height: 10.h,
                                    fit: BoxFit.fill,
                                  ))),
                          value: "fr",
                        ),
                      ],
                      onChanged: (value) async {
                        controller.onSelected(value as String);
                      },
                      value: controller.selectedValue!.value,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconEnabledColor: Colors.black,
                      underline: Container(),
                    ),
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
