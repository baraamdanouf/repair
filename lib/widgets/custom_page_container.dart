import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/main/main_page.dart';
import 'package:repair_app/widgets/custom_dialog.dart';
import 'package:repair_app/widgets/custom_logo_container.dart';

class CustomPageContainer extends StatelessWidget {
  final String? text;
  final bool? isFilter, isService, isDashboard, isDashboardIcons, isDrawer;
  final int? role;

  const CustomPageContainer({
    Key? key,
    this.text,
    this.isFilter,
    this.isDashboard,
    this.isService,
    this.isDashboardIcons,
    this.isDrawer,
    this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DropdownController());
//    const int role = 0;
    final RxList<Map<dynamic, String>> date = [
      {"radio": "0", "filter": "one month"},
      {"radio": "1", "filter": "three months"},
      {"radio": "2", "filter": "six months"},
      {"radio": "3", "filter": "one year"},
      {"radio": "4", "filter": "custom"},
    ].obs;

    final RxList<Map<dynamic, String>> worker = [
      {"radio": "0", "filter": "محمد سعيد"},
      {"radio": "1", "filter": "صهيب"},
      {"radio": "2", "filter": "مسعود"},
      {"radio": "3", "filter": "إياد"},
      {"radio": "4", "filter": "رامي"},
    ].obs;

    final RxList<Map<dynamic, String>> building = [
      {"radio": "0", "filter": "لاجون تاون"},
      {"radio": "1", "filter": "اساس تاور"},
      {"radio": "2", "filter": "بانوراما"},
      {"radio": "3", "filter": "شهد تاور"},
      {"radio": "4", "filter": "ماجستك"},
    ].obs;

    final RxList<Map<dynamic, String>> service = [
      {"radio": "0", "filter": "air conditioning \nand refrigeration"},
      {"radio": "1", "filter": "cleaning \nand sterilization"},
      {"radio": "2", "filter": "paint"},
      {"radio": "3", "filter": "lighting \nand lighting"},
      {"radio": "4", "filter": "plumbing"},
    ].obs;

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
            child: Obx(
              () => DropdownButton(
                items: [
                  DropdownMenuItem(
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
                    value: "ar",
                  ),
                  DropdownMenuItem(
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
                    value: "en",
                  ),
                  DropdownMenuItem(
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
                  onTap: () {
                    Get.dialog(
                      CustomDialog(
                        texts: date,
                        title: "Filter by".tr,
                      ),
                    );
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
            SizedBox(height: role == 0 ? 0.h : 10.h),
            Visibility(
              visible: isDashboard!,
              child: Container(
                height: LocalStorage.languageSelected == "ar" ? 72.h : 80.h,
                padding: EdgeInsets.only(bottom: 1.h, left: 30.w, right: 30.w),
                //decoration: const BoxDecoration(color: secondaryColor),
                child: role == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Get.dialog(CustomDialog(
                                texts: date,
                                title: "Filter by".tr,
                              ));
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  helpText: 'Select date'.tr,
                                  confirmText: 'Ok'.tr,
                                  cancelText: 'Cancel'.tr,
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: primaryColor,
                                          onPrimary: Colors.white,
                                          onSurface: greyDark,
                                        ),
                                        shadowColor: Colors.transparent,
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                              primary:
                                                  primaryColor // button text color
                                              ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  });
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
                            onTap: () {
                              Get.dialog(CustomDialog(
                                texts: worker,
                                title: "worker".tr,
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
                            onTap: () {
                              Get.dialog(CustomDialog(
                                texts: building,
                                title: "building".tr,
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
                            onTap: () {
                              Get.dialog(CustomDialog(
                                texts: service,
                                title: "service type".tr,
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
                              Text(
                                "services \nperformed".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.h,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
                              Text(
                                "services in \nprogress".tr,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.h,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
                              Text(
                                "services \ncanceled".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.h,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                        ],
                      ),
              ),
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
}
