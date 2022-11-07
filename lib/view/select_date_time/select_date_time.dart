import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/bill/bill.dart';
import 'package:repair_app/view/select_date_time/select_date_time_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class SelectDateTime extends GetView<SelectDateTimeController> {
  const SelectDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SelectDateTimeController());
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
//   controller.times.clear();
    final RxString time = ''.obs;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          Scaffold(
            key: controller.selectDateTimeKey,
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 200.h,
              elevation: 0,
              actions: [
                CustomPageContainer(
                  isService: true,
                  isFilter: false,
                  text: "Set a date and time for the appointment".tr,
                  isDashboard: false,
                  isDashboardIcons: false,
                  isDrawer: false,
                )
              ],
            ),
            body: Container(
                width: width,
                height: height,
                margin: EdgeInsets.only(top: 10.h, bottom: 45.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    serviceRequestItem(),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    Text(
                      "Set appointments".tr,
                      style: TextStyle(color: primaryColor,
                          fontSize: 22.h,
                          fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Container(
                              width: 375.w,
                              height: 70.h,
                              child: ListView.builder(
                                  itemCount: controller.times.value.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, int index) => Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [SizedBox(
                                            height: 25.h,
                                            child: Center(child: Text(
                                              controller.times.value[index],
                                              style: TextStyle(
                                                  color: greyDark, fontSize: 17.h
                                              ),)),
                                          ), const Divider(
                                            color: greyDark,
                                            thickness: 1,
                                          ),
                                          ])),)),
                    SizedBox(
                      height: 30.h,
                      child: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: controller.dateTime1.value,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100)
                              initialDatePickerMode: DatePickerMode.year,
                              initialEntryMode: DatePickerEntryMode.calendarOnly,
                              helpText: 'Select date'.tr,
                              confirmText: 'Ok'.tr,
                              cancelText: 'Cancel'.tr
                              builder: (context, child)
                          {
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
                                      primary: primaryColor // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          });
                          if (pickedDate == null) return;
                          TimeOfDay? pickedTime1 = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                          hour: controller.dateTime1.value.hour,
                          minute: controller.dateTime1.value.hour)
                          helpText: "اختيار الوقت من",
                          builder:(context,child) {
                          return Theme(
                          data:Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(primary: primaryColor, onPrimary: Colors.white, onSurface: Colors.black,),
                          shadowColor: context.theme.backgroundColor,
                          textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(primary: primaryColor // button text color
                          ),),),
                          child:child!,);});
                          TimeOfDay? pickedTime2 = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                          hour: controller.dateTime2.value.hour,
                          minute: controller.dateTime2.value.hour)
                          helpText: "اختيار الوقت إلى",
                          builder:(context,child) {
                          return Theme(
                          data:Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(primary: primaryColor, onPrimary: Colors.white, onSurface: Colors.black,),
                          shadowColor: context.theme.backgroundColor,
                          textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(primary: primaryColor // button text color
                          ),),),
                          child:child!,);},
                          );
                          if (pickedTime1 == null && pickedTime2 == null) return;
                          final newDateTime1 = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime1!.hour,
                          pickedTime1.minute);
                          final newDateTime2 = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime2!.hour,
                          pickedTime2.minute);
                          time.value =
                          "${controller.dateTime1.value.year}/${controller.dateTime1.value.month}/${controller.dateTime1.value.day}   |  من${controller.dateTime1.value.hour}:${controller.dateTime1.value.minute}  إلى ${controller.dateTime2.value.hour}:${controller.dateTime2.value.minute}";
                          controller.times.add(time.value);
                          controller.dateTime1.value = newDateTime1;
                          controller.dateTime2.value = newDateTime2;
                        },
                        child: Center(
                          child: Container(
                            width: 33.w,
                            height: 30.h,
                            decoration: const BoxDecoration(color: green, shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              size: 25.h,
                              color: Colors.white,
                            ),
                          ),
                        ),),
                    ),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    SizedBox(
                      child: Text(
                        "select technician".tr,
                        style: TextStyle(color: primaryColor,
                            fontSize: 22.h,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    SizedBox(width: width,
                      child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width: 125.w,
                                    height: 45.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "محمد الأحمد".tr,
                                          style: TextStyle(color: greyDark,
                                            fontSize: 20.h,
                                             ),
                                        ),
                                        Icon(
                                          CupertinoIcons.person_solid,
                                          color: primaryColor,
                                          size: 30.w,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            5.r),
                                        border: Border.all(
                                            color: greyVeryDark))),
                                Container(
                                    width: 125.w,
                                    height: 45.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "محمد الأحمد".tr,
                                          style: TextStyle(color: greyDark,
                                            fontSize: 20.h,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.person_solid,
                                          color: primaryColor,
                                          size: 30.w,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            5.r),
                                        border: Border.all(
                                            color: greyVeryDark))),
                                Container(
                                    width: 125.w,
                                    height: 45.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "محمد الأحمد".tr,
                                          style: TextStyle(color: greyDark,
                                            fontSize: 20.h,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.person_solid,
                                          color: primaryColor,
                                          size: 30.w,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            5.r),
                                        border: Border.all(
                                            color: greyVeryDark))),
                              ])),
                    ),
                    SizedBox(height: 5.h,),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    Text(
                      "cost state".tr,
                      style: TextStyle(color: primaryColor,
                          fontSize: 22.h,
                          fontWeight: FontWeight.bold),
                    ),
                  //  SizedBox(height: 5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          onPressed: () async {},
                          text: "free".tr,
                          width: 121.w,
                          backgroundColor: primaryColor,
                        ),
                        CustomButton(
                          onPressed: () async {},
                          text: "paid".tr,
                          width: 121.w,
                          backgroundColor: primaryColor,
                        ),
                        CustomButton(
                          onPressed: () async {},
                          text: "undefined".tr,
                          width: 121.w,
                          backgroundColor: primaryColor,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: CustomButton(
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const Bill()));
                          },
                        text: "send appointment".tr,
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
