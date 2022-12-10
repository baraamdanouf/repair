import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';

class SelectDateTimeController extends GetxController {
  final GlobalKey<ScaffoldState> selectDateTimeKey = GlobalKey<ScaffoldState>();

  RxList<String> times = RxList<String>([]);
  final selectedDate = DateTime
      .now()
      .obs;
  final dateTime1 = TimeOfDay
      .now()
      .obs;
  final dateTime2 = TimeOfDay
      .now()
      .obs;

  final RxString time = ''.obs;

   onChangeDateTime() async
  {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
        initialDatePickerMode: DatePickerMode.day,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        helpText: 'Select date'.tr,
        confirmText: 'Ok'.tr,
        cancelText: 'Cancel'.tr
        builder: (context, child)
    {
      return Theme(
        data: Theme.of(context).copyWith(
          textTheme: TextTheme(
              overline: TextStyle(
                  color: Colors.white,
                  fontSize: 15.h,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0)),
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
  if (pickedDate != null && pickedDate != selectedDate.value) {
  selectedDate.value = pickedDate;
  }
  TimeOfDay? pickedTime1 = await showTimePicker(
  context: Get.context!,
  initialTime: dateTime1.value.replacing(hour: dateTime1.value.hourOfPeriod)
  helpText: "Select time from".tr,
  initialEntryMode: TimePickerEntryMode.input,
  builder:(context,child) {
  return Theme(data:Theme.of(context).copyWith(
  textTheme: TextTheme(overline: TextStyle(color: primaryColor,fontSize: 15.h,fontWeight: FontWeight.bold,
  letterSpacing: 0)),
  colorScheme: const ColorScheme.light(primary: primaryColor, onPrimary: Colors.white, onSurface: primaryColor),
  shadowColor: Colors.transparent,
  textButtonTheme: TextButtonThemeData(
  style: TextButton.styleFrom(primary: primaryColor
  ))),
  child:child!);
  }
    );
    TimeOfDay? pickedTime2 = await showTimePicker(context: Get.context!,

    initialTime: dateTime2.value.replacing(hour: dateTime2.value.hourOfPeriod)
    helpText: "Select time to".tr,
    initialEntryMode: TimePickerEntryMode.input,
    builder:(context,child) {
    return Theme(data:Theme.of(context).copyWith(
    textTheme: TextTheme(overline: TextStyle(color: primaryColor,fontSize: 15.h,fontWeight: FontWeight.bold,
    letterSpacing: 0)),
    colorScheme: const ColorScheme.light(primary: primaryColor, onPrimary: Colors.white, onSurface: primaryColor),
    shadowColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: primaryColor
    ))),
    child:child!);
    }
    );
    if (pickedTime1 == null && pickedTime2 == null) return;
    dateTime1.value = pickedTime1!;
    dateTime2.value = pickedTime2!;
    final hour1 = dateTime1.value.hour.toString().padLeft(2,'0').obs;
  final min1 = dateTime1.value.minute.toString().padLeft(2, '0').obs;
  final hour2 = dateTime2.value.hour.toString().padLeft(2,'0').obs;
  final min2 = dateTime2.value.minute.toString().padLeft(2, '0').obs;
  time.value ="${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}   |  "+"from".tr +" ${hour1.value}:${min1.value}  "+"to".tr +" ${hour2.value}:${min2.value}".tr;
    times.add(time.value);

    }
}
