import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/ui/main/main_page.dart';
import 'package:repair_app/widgets/custom_logo_container.dart';

class CustomPageContainer extends StatelessWidget {
  final String? text;
  final bool? isFilter, isService, isDashboard, isDashboardIcons, isDrawer;
  final int? role;

  const CustomPageContainer({
    Key? key,
    this.text,
    this.isFilter = false,
    this.isDashboard = false,
    this.isService = false,
    this.isDashboardIcons = false,
    this.isDrawer = false,
    this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DropdownController());
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        padding: EdgeInsets.only(top: 15.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(fit: StackFit.expand, children: [
          Positioned(
            left: isService! ? 45.w : 15.w,
            child:
            Obx(
              () => DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Center(
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(20.r),
                          child: Image.asset(
                            'icons/flags/png/ae.png',
                            package: 'country_icons',
                            width: 30.w,
                            height: 30.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    value: "ar",
                  ),
                  DropdownMenuItem(
                    child: Center(
                      child: ClipOval(
                          child: SizedBox.fromSize(
                              size: Size.fromRadius(20.r),
                              child: Image.asset(
                                'icons/flags/png/us.png',
                                package: 'country_icons',
                                width: 30.w,
                                height: 30.h,
                                fit: BoxFit.fill,
                              ))),
                    ),
                    value: "en",
                  ),
                  DropdownMenuItem(
                    child: Center(
                      child: ClipOval(
                          child: SizedBox.fromSize(
                              size: Size.fromRadius(20.r),
                              child: Image.asset(
                                'icons/flags/png/fr.png',
                                package: 'country_icons',
                                width: 30.w,
                                height: 30.h,
                                fit: BoxFit.fill,
                              ))),
                    ),
                    value: "fr",
                  ),
                ],
                onChanged: (value) async {
                  controller.onSelected(value as String);
                },
                value: controller.selectedValue!.value,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconEnabledColor: Colors.white,
                //Icon color
                underline: Container(),
              ),
            ),
          ),
          Visibility(
            visible: isFilter!,
            child: Positioned(
              left: 356.w,
              top: 80.h,
              child: Column(children: [
                InkWell(
                  onTap: () async {
                    await Get.dialog(SizedBox(
                      width: 600.w,
                      height: 600.h,
                      child: AlertDialog(
                          alignment: const Alignment(0.5, -0.5),
                          title: Container(
                            color: Colors.white,
                            width: 218.w,
                            height: 35.h,
                            child: Text(
                              "Filter by".tr,
                              style: const TextStyle(
                                  color: primaryColor, height: 1),
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          content: SizedBox(
                              height: LocalStorage.languageSelected == "ar"
                                  ? 255.h
                                  : 205.h,
                              width: 300.w,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: primaryColor,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.w, vertical: 10.h),
                                      child: Column(
                                        children: [
                                          itemDialog("one month", false, 0, 1,
                                              controller.selectedDate),
                                          itemDialog("three months", false, 1,
                                              1, controller.selectedDate),
                                          itemDialog("six months", false, 2, 1,
                                              controller.selectedDate),
                                          itemDialog("one year", false, 3, 1,
                                              controller.selectedDate),
                                          itemDialog("custom", true, 4, 1,
                                              controller.selectedDate),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ))),
                    ));
                  },
                  child: SvgPicture.asset(
                    funnel,
                    height: 30.h,
                  ),
                ),
                Text(
                  "sort by".tr,
                  style: TextStyle(
                      fontSize: 10.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ]),
            ),
          ),
          Visibility(
            visible: isService!,
            child: Positioned(
              left: 1.w,
              child: IconButton(
                icon: Icon(
                  LocalStorage.languageSelected == "ar"
                      ? Icons.arrow_forward_ios_outlined
                      : Icons.arrow_back_ios_outlined,
                  size: 20.w,
                ),
                onPressed: () {
                  isDrawer!
                      ? Get.offAll(const MainPage())
                      : Navigator.pop(context);
                },
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(top: 5.h, bottom: 13.h),
                child: SvgPicture.asset(
                  imgLogo,
                  height: 113.h,
                )),
            Visibility(
              visible: !isDashboardIcons!,
              child: Text(
                text!,
                style: TextStyle(
                    fontSize: 20.h,
                    color: Colors.white,
                    fontWeight: LocalStorage.languageSelected == "ar"
                        ? FontWeight.bold
                        : FontWeight.w400),
              ),
            ),
            Visibility(
                visible: !isDashboardIcons!,
                child: SizedBox(
                    height: LocalStorage.languageSelected == "ar" ? 8.h : 14.h,
                    width: 200.w,
                    child: Divider(
                      color: Colors.white.withOpacity(0.7),
                      thickness: 1.3,
                    ))),
            SizedBox(height: isDashboard! ? 0.h : 10.h),
            Visibility(
              visible: role == 0,
              child: Container(
                height: LocalStorage.languageSelected == "ar" ? 72.h : 80.h,
                padding: EdgeInsets.only(bottom: 1.h, left: 30.w, right: 30.w),
                child: isDashboard!
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Get.dialog(SizedBox(
                                width: 600.w,
                                height: 600.h,
                                child: AlertDialog(
                                    alignment: const Alignment(0.5, -0.5),
                                    title: Container(
                                      color: Colors.white,
                                      width: 218.w,
                                      height: 35.h,
                                      child: Text(
                                        "Filter by".tr,
                                        style: const TextStyle(
                                            color: primaryColor, height: 1),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    content: SizedBox(
                                        height: LocalStorage.languageSelected ==
                                                "ar"
                                            ? 255.h
                                            : 205.h,
                                        width: 300.w,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: primaryColor,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40.w,
                                                    vertical: 10.h),
                                                child: Column(
                                                  children: [
                                                    itemDialog(
                                                        "one month",
                                                        false,
                                                        0,
                                                        1,
                                                        controller
                                                            .selectedDate),
                                                    itemDialog(
                                                        "three months",
                                                        false,
                                                        1,
                                                        1,
                                                        controller
                                                            .selectedDate),
                                                    itemDialog(
                                                        "six months",
                                                        false,
                                                        2,
                                                        1,
                                                        controller
                                                            .selectedDate),
                                                    itemDialog(
                                                        "one year",
                                                        false,
                                                        3,
                                                        1,
                                                        controller
                                                            .selectedDate),
                                                    itemDialog(
                                                        "custom",
                                                        true,
                                                        4,
                                                        1,
                                                        controller
                                                            .selectedDate),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ));
                            },
                            child: Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                width: 88.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(color: greyVeryDark)),
                                child: Center(
                                    child: Text("date".tr,
                                        style: TextStyle(
                                            fontSize: 18.h,
                                            color: primaryColor)))),
                          ),
                          InkWell(
                            onTap: () async {
                              await Get.dialog(SizedBox(
                                width: 600.w,
                                height: 600.h,
                                child: AlertDialog(
                                    alignment: const Alignment(0.5, -0.5),
                                    title: Container(
                                      color: Colors.white,
                                      width: 218.w,
                                      height: 35.h,
                                      child: Text(
                                        "worker".tr,
                                        style: const TextStyle(
                                            color: primaryColor, height: 1),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    content: SizedBox(
                                        height: 255.h,
                                        width: 300.w,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: primaryColor,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40.w,
                                                    vertical: 10.h),
                                                child: Column(
                                                  children: [
                                                    itemDialog(
                                                        "محمد سعيد",
                                                        false,
                                                        0,
                                                        2,
                                                        controller
                                                            .selectedWorker),
                                                    itemDialog(
                                                        "صهيب",
                                                        false,
                                                        1,
                                                        2,
                                                        controller
                                                            .selectedWorker),
                                                    itemDialog(
                                                        "مسعود",
                                                        false,
                                                        2,
                                                        2,
                                                        controller
                                                            .selectedWorker),
                                                    itemDialog(
                                                        "إياد",
                                                        false,
                                                        3,
                                                        2,
                                                        controller
                                                            .selectedWorker),
                                                    itemDialog(
                                                        "رامي",
                                                        false,
                                                        4,
                                                        2,
                                                        controller
                                                            .selectedWorker),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ));
                            },
                            child: Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                width: 88.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(color: greyVeryDark)),
                                child: Center(
                                    child: Text("worker".tr,
                                        style: TextStyle(
                                            fontSize: 18.h,
                                            color: primaryColor)))),
                          ),
                          InkWell(
                            onTap: () async {
                              await Get.dialog(SizedBox(
                                width: 600.w,
                                height: 600.h,
                                child: AlertDialog(
                                    alignment: const Alignment(0.5, -0.5),
                                    title: Container(
                                      color: Colors.white,
                                      width: 218.w,
                                      height: 35.h,
                                      child: Text(
                                        "building".tr,
                                        style: const TextStyle(
                                            color: primaryColor, height: 1),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    content: SizedBox(
                                        height: 255.h,
                                        width: 300.w,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: primaryColor,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40.w,
                                                    vertical: 10.h),
                                                child: Column(
                                                  children: [
                                                    itemDialog(
                                                        "لاجون تاون",
                                                        false,
                                                        0,
                                                        3,
                                                        controller
                                                            .selectedBuilding),
                                                    itemDialog(
                                                        "اساس تاور",
                                                        false,
                                                        1,
                                                        3,
                                                        controller
                                                            .selectedBuilding),
                                                    itemDialog(
                                                        "بانوراما",
                                                        false,
                                                        2,
                                                        3,
                                                        controller
                                                            .selectedBuilding),
                                                    itemDialog(
                                                        "شهد تاور",
                                                        false,
                                                        3,
                                                        3,
                                                        controller
                                                            .selectedBuilding),
                                                    itemDialog(
                                                        "ماجستك",
                                                        false,
                                                        4,
                                                        3,
                                                        controller
                                                            .selectedBuilding),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ));
                            },
                            child: Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                width: 88.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(color: greyVeryDark)),
                                child: Center(
                                    child: Text("building".tr,
                                        style: TextStyle(
                                            fontSize: 18.h,
                                            color: primaryColor)))),
                          ),
                          InkWell(
                            onTap: () async {
                              await Get.dialog(SizedBox(
                                width: 600.w,
                                height: 600.h,
                                child: AlertDialog(
                                    alignment: const Alignment(0.5, -0.5),
                                    title: Container(
                                      color: Colors.white,
                                      width: 218.w,
                                      height: 35.h,
                                      child: Text(
                                        "service".tr,
                                        style: const TextStyle(
                                            color: primaryColor, height: 1),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    content: SizedBox(
                                        height: 255.h,
                                        width: 300.w,
                                        child: Column(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              color: primaryColor,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 40.w,
                                                  vertical: 10.h),
                                              child: Column(
                                                children: [
                                                  itemDialog(
                                                      "air conditioning and refrigeration",
                                                      false,
                                                      0,
                                                      4,
                                                      controller
                                                          .selectedService),
                                                  itemDialog(
                                                      "cleaning and sterilization",
                                                      false,
                                                      1,
                                                      4,
                                                      controller
                                                          .selectedService),
                                                  itemDialog(
                                                      "paint",
                                                      false,
                                                      2,
                                                      4,
                                                      controller
                                                          .selectedService),
                                                  itemDialog(
                                                      "lighting and lighting",
                                                      false,
                                                      3,
                                                      4,
                                                      controller
                                                          .selectedService),
                                                  itemDialog(
                                                      "plumbing",
                                                      false,
                                                      4,
                                                      4,
                                                      controller
                                                          .selectedService),
                                                ],
                                              ),
                                            )),
                                          ],
                                        ))),
                              ));
                            },
                            child: Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                width: 88.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(color: greyVeryDark)),
                                child: Center(
                                    child: Text("service type".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18.h,
                                            color: primaryColor)))),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 5.h),
                                  width: 88.w,
                                  height: 38.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(23.r),
                                      border: Border.all(color: greyVeryDark)),
                                  child: Center(
                                      child: Text("9",
                                          style: TextStyle(
                                              fontSize: 18.h,
                                              color: Colors.black)))),
                              SizedBox(
                                width: 110.w,
                                child: Text(
                                  "services performed".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.h,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                width: 88.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(color: greyVeryDark)),
                                child: Center(
                                    child: Text(
                                  "4",
                                  style: TextStyle(
                                      fontSize: 18.h, color: Colors.black),
                                )),
                              ),
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  "services in progress".tr,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.h,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                width: 88.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(color: greyVeryDark)),
                                child: Center(
                                    child: Text(
                                  "9",
                                  style: TextStyle(
                                      fontSize: 18.h, color: Colors.black),
                                )),
                              ),
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  "services canceled".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.h,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                        ],
                      ),
              ),
            ),
            Visibility(
              visible: isDashboard! && role == 1,
              child: Container(
                  height: LocalStorage.languageSelected == "ar" ? 72.h : 80.h,
                  padding:
                      EdgeInsets.only(bottom: 1.h, left: 30.w, right: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Get.dialog(SizedBox(
                            width: 600.w,
                            height: 600.h,
                            child: AlertDialog(
                                alignment: const Alignment(0.5, -0.5),
                                title: Container(
                                  color: Colors.white,
                                  width: 218.w,
                                  height: 35.h,
                                  child: Text(
                                    "Filter by".tr,
                                    style: const TextStyle(
                                        color: primaryColor, height: 1),
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                content: SizedBox(
                                    height:
                                        LocalStorage.languageSelected == "ar"
                                            ? 255.h
                                            : 205.h,
                                    width: 300.w,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: primaryColor,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40.w,
                                                vertical: 10.h),
                                            child: Column(
                                              children: [
                                                itemDialog(
                                                    "one month",
                                                    false,
                                                    0,
                                                    1,
                                                    controller.selectedDate),
                                                itemDialog(
                                                    "three months",
                                                    false,
                                                    1,
                                                    1,
                                                    controller.selectedDate),
                                                itemDialog(
                                                    "six months",
                                                    false,
                                                    2,
                                                    1,
                                                    controller.selectedDate),
                                                itemDialog("one year", false, 3,
                                                    1, controller.selectedDate),
                                                itemDialog("custom", true, 4, 1,
                                                    controller.selectedDate),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))),
                          ));
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            width: 88.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.r),
                                border: Border.all(color: greyVeryDark)),
                            child: Center(
                                child: Text("date".tr,
                                    style: TextStyle(
                                        fontSize: 18.h, color: primaryColor)))),
                      ),
                      InkWell(
                        onTap: () async {
                          await controller.onChangeTime();
                          await Get.dialog(SizedBox(
                              width: 600.w,
                              height: 600.h,
                              child: AlertDialog(
                                  alignment: const Alignment(0.5, -0.5),
                                  title: Container(
                                    color: Colors.white,
                                    width: 218.w,
                                    height: 35.h,
                                    child: Text(
                                      "clock".tr,
                                      style: const TextStyle(
                                          color: primaryColor, height: 1),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  content: Container(
                                        color: primaryColor,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.w, vertical: 5.h),
                                        child: SizedBox(
                                            height: 100.h,
                                            width: 300.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "from".tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "${controller.hour1.value}:${controller.min1.value}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "to".tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "${controller.hour2.value}:${controller.min2.value}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ))),
                                  )));
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            width: 88.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.r),
                                border: Border.all(color: greyVeryDark)),
                            child: Center(
                                child: Text("clock".tr,
                                    style: TextStyle(
                                        fontSize: 18.h, color: primaryColor)))),
                      ),
                      InkWell(
                        onTap: () async {
                          await Get.dialog(SizedBox(
                            width: 600.w,
                            height: 600.h,
                            child: AlertDialog(
                                alignment: const Alignment(0.5, -0.5),
                                title: Container(
                                  color: Colors.white,
                                  width: 218.w,
                                  height: 35.h,
                                  child: Text(
                                    "building".tr,
                                    style: const TextStyle(
                                        color: primaryColor, height: 1),
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                content: SizedBox(
                                    height: 255.h,
                                    width: 300.w,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: primaryColor,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40.w,
                                                vertical: 10.h),
                                            child: Column(
                                              children: [
                                                itemDialog(
                                                    "لاجون تاون",
                                                    false,
                                                    0,
                                                    3,
                                                    controller
                                                        .selectedBuilding),
                                                itemDialog(
                                                    "اساس تاور",
                                                    false,
                                                    1,
                                                    3,
                                                    controller
                                                        .selectedBuilding),
                                                itemDialog(
                                                    "بانوراما",
                                                    false,
                                                    2,
                                                    3,
                                                    controller
                                                        .selectedBuilding),
                                                itemDialog(
                                                    "شهد تاور",
                                                    false,
                                                    3,
                                                    3,
                                                    controller
                                                        .selectedBuilding),
                                                itemDialog(
                                                    "ماجستك",
                                                    false,
                                                    4,
                                                    3,
                                                    controller
                                                        .selectedBuilding),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))),
                          ));
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            width: 88.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.r),
                                border: Border.all(color: greyVeryDark)),
                            child: Center(
                                child: Text("building".tr,
                                    style: TextStyle(
                                        fontSize: 18.h, color: primaryColor)))),
                      ),
                      InkWell(
                        onTap: () async {
                          await Get.dialog(SizedBox(
                            width: 600.w,
                            height: 600.h,
                            child: AlertDialog(
                                alignment: const Alignment(0.5, -0.5),
                                title: Container(
                                  color: Colors.white,
                                  width: 218.w,
                                  height: 35.h,
                                  child: Text(
                                    "unit no".tr,
                                    style: const TextStyle(
                                        color: primaryColor, height: 1),
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                content: SizedBox(
                                    height: 205.h,
                                    width: 300.w,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          color: primaryColor,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40.w, vertical: 10.h),
                                          child: Column(
                                            children: [
                                              itemDialog("101", false, 0, 5,controller.selectedUnit),
                                              itemDialog("102", false, 1, 5, controller.selectedUnit),
                                              itemDialog("103", false, 2, 5, controller.selectedUnit),
                                              itemDialog("104", false, 3, 5, controller.selectedUnit),
                                              itemDialog("105", false, 4, 5, controller.selectedUnit),
                                            ],
                                          ),
                                        )),
                                      ],
                                    ))),
                          ));
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            width: 88.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.r),
                                border: Border.all(color: greyVeryDark)),
                            child: Center(
                                child: Text("unit no".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.h, color: primaryColor)))),
                      ),
                    ],
                  )),
            ),
            Visibility(
              visible: isDashboardIcons!,
              child: Container(
                height: LocalStorage.languageSelected == "ar" ? 72.h : 80.h,
                padding: EdgeInsets.only(bottom: 1.h, left: 30.w, right: 30.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 5.h),
                          width: 110.w,
                          height: 110.h,
                          decoration: BoxDecoration(
                              color: greenWhite,
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(color: greyVeryDark)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                check,
                                width: 23.w,
                                height: 23.h,
                              ),
                              Text(
                                "requests performed".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.h,
                                    color: green,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 5.h),
                          width: 110.w,
                          height: 110.h,
                          decoration: BoxDecoration(
                              color: orangeWhite,
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(color: greyVeryDark)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(inProgress),
                              Text(
                                "requests in progress".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.h,
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 5.h),
                          width: 110.w,
                          height: 110.h,
                          decoration: BoxDecoration(
                              color: redWhite,
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(color: greyVeryDark)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(error),
                              Text(
                                "requests canceled".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.h,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ]),
              ),
            ),
          ])
        ]));
  }

  Widget itemDialog(String? text, bool? isCustom, int? value, int? condition,
      RxInt? groupValue) {
    final controller = Get.put(DropdownController());
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          heightFactor: 0.8,
          child: InkWell(
            onTap: ()
            {
              switch (condition) {
                case 1:
                  controller.onChangeDateFilter(value);
                  break;
                case 2:
                  controller.onChangeWorker(value);
                  break;
                case 3:
                  controller.onChangeBuilding(value);
                  break;
                case 4:
                  controller.onChangeService(value);
                  break;
                case 5:
                  controller.onChangeUnit(value);
              }
              isCustom! ? controller.onChangeDate() : null;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(text!.tr,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19.h)),
                  width: 166.w,
                ),
                  SizedBox(
                    height: 20.h,
                    child: Transform.scale(
                      scale: 1,
                      child: Obx(
                        () => Radio(
                            onChanged: (value) {},
                            value: value!,
                            groupValue: groupValue!.value,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            activeColor: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
          thickness: 1.5,
        )
      ],
    );
  }
}
