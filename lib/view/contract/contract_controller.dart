import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';

class ContractController extends GetxController {
  final GlobalKey<ScaffoldState> contractKey = GlobalKey<ScaffoldState>();

  var selectedDateStart = DateTime.now().obs;
  var selectedDateEnd = DateTime.now().obs;

  onChangeDate(Rx<DateTime> date) async
  {
    DateTime? pickedDate = await showDatePicker(context: Get.context!,
      initialDate: date.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: 'Select date'.tr,
      confirmText: 'Ok'.tr,
      cancelText: 'Cancel'.tr
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
                  primary: primaryColor // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != date.value) {
      date.value = pickedDate;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
