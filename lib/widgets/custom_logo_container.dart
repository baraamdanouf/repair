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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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

  void onSelected(String value) async {
    selectedValue!.value = value;
    LocalStorage.savedLanguageToDisk(value);
    await Get.updateLocale(Locale(value));
  }
}
