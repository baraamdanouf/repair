import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';

class CustomLogoContainer extends StatelessWidget {
  final String text;

  const CustomLogoContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DropdownController());
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      width: width,
      height: height * 0.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 15.w,
            top: 15.h,
            child: Obx(
                  () =>
                  DropdownButton(
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
                    underline: Container(),
                  ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 33.h, color: Colors.white),
                ),
              ),
              SvgPicture.asset(
                imgLogo,
                height: 204.64.h,
                width: 212.07.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownController extends GetxController {
  final RxString? selectedValue = LocalStorage.languageSelected.obs;
  var selectedDate = 0.obs;
  var selectedWorker = 0.obs;
  var selectedBuilding = 0.obs;
  var selectedService = 0.obs;
  var selectedUnit = 0.obs;
  final selectDate = DateTime
      .now()
      .obs;

  final dateTime1 = TimeOfDay
      .now()
      .obs;
  final dateTime2 = TimeOfDay
      .now()
      .obs;

  onChangeDateFilter(var service) {
    selectedDate.value = service;
  }

  void onChangeWorker(var service) {
    selectedWorker.value = service;
  }

  void onChangeBuilding(var service) {
    selectedBuilding.value = service;
  }

  void onChangeService(var service) {
    selectedService.value = service;
  }
  void onChangeUnit(var service) {
    selectedUnit.value = service;
  }

  void onSelected(String value) async {
    selectedValue!.value = value;
    LocalStorage.savedLanguageToDisk(value);
    await Get.updateLocale(Locale(value));
  }

  onChangeDate() async
  {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectDate.value,
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
  if (pickedDate != null && pickedDate != selectDate.value) {
  selectDate.value = pickedDate;
  }}

  var hour1 = ''.obs;
  var min1 = ''.obs;
  var hour2 = ''.obs;
  var min2 = ''.obs;

  onChangeTime() async
  {
    TimeOfDay? pickedTime1 = await showTimePicker(
        context: Get.context!,
        initialTime: dateTime1.value.replacing(
            hour: dateTime1.value.hourOfPeriod)
        helpText: "Select time from".tr,
        initialEntryMode: TimePickerEntryMode.input,
        builder: (context, child) {
          return Theme(data: Theme.of(context).copyWith(
              textTheme: TextTheme(overline: TextStyle(color: primaryColor,
                  fontSize: 15.h,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0)),
              colorScheme: const ColorScheme.light(primary: primaryColor,
                  onPrimary: Colors.white,
                  onSurface: primaryColor),
              shadowColor: Colors.transparent,
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: primaryColor
                  ))),
              child: child!);
        }
    );
    TimeOfDay? pickedTime2 = await showTimePicker(context: Get.context!,

        initialTime: dateTime2.value.replacing(
            hour: dateTime2.value.hourOfPeriod)
        helpText: "Select time to".tr,
        initialEntryMode: TimePickerEntryMode.input,
        builder: (context, child) {
          return Theme(data: Theme.of(context).copyWith(
              textTheme: TextTheme(overline: TextStyle(color: primaryColor,
                  fontSize: 15.h,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0)),
              colorScheme: const ColorScheme.light(primary: primaryColor,
                  onPrimary: Colors.white,
                  onSurface: primaryColor),
              shadowColor: Colors.transparent,
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: primaryColor
                  ))),
              child: child!);
        }
    );
    if (pickedTime1 == null && pickedTime2 == null) return;
    dateTime1.value = pickedTime1!;
    dateTime2.value = pickedTime2!;
    hour1 = dateTime1.value.hour
        .toString()
        .padLeft(2, '0')
        .obs;
    min1 = dateTime1.value.minute
        .toString()
        .padLeft(2, '0')
        .obs;
    hour2 = dateTime2.value.hour
        .toString()
        .padLeft(2, '0')
        .obs;
    min2 = dateTime2.value.minute
        .toString()
        .padLeft(2, '0')
        .obs;
  }
}
