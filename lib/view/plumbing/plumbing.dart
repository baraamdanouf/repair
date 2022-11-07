import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/conditioning/conditioning.dart';
import 'package:repair_app/view/plumbing/plumbing_controller.dart';
import 'package:repair_app/view/select_apartment/select_apartment.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Plumbing extends GetView<PlumbingController> {
  const Plumbing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PlumbingController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.plumbingKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "plumbing".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: false,
            )
          ],
        ),
        body: Container(
            width: width,
            height: height,
            margin: EdgeInsets.only(top: 10.h, bottom: 70.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            child: Obx(
                              () => Checkbox(
                                  // autofocus: true,
                                  value: controller.isChecked1.value,
                                  onChanged: (value) {
                                    controller.isChecked1.value = value!;
                                  },
                                  activeColor: primaryColor,
                                  checkColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                    color: Colors.white60,
                                  ))),
                            ),
                            data: Theme.of(Get.context!)
                                .copyWith(unselectedWidgetColor: greyVeryDark),
                          ),
                          Text(
                            "faucet repair".tr,
                            style: TextStyle(
                                color: primaryColor,
                                height: LocalStorage.languageSelected == "ar"
                                    ? 0.h
                                    : 1.9.h,
                                fontWeight:
                                    LocalStorage.languageSelected == "ar"
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                fontSize: 18.h),
                          ),
                        ],
                      ),
                      const Divider(
                        color: secondaryColor,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            child: Obx(
                              () => Checkbox(
                                  value: controller.isChecked2.value,
                                  onChanged: (value) {
                                    controller.isChecked2.value = value!;
                                  },
                                  activeColor: primaryColor,
                                  checkColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                    color: Colors.white60,
                                  ))),
                            ),
                            data: Theme.of(Get.context!)
                                .copyWith(unselectedWidgetColor: greyVeryDark),
                          ),
                          Text(
                            "faucet repair".tr,
                            style: TextStyle(
                                color: primaryColor,
                                height: LocalStorage.languageSelected == "ar"
                                    ? 0.h
                                    : 1.9.h,
                                fontWeight:
                                    LocalStorage.languageSelected == "ar"
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                fontSize: 18.h),
                          ),
                        ],
                      ),
                      const Divider(
                        color: secondaryColor,
                        thickness: 1,
                      )
                    ]),
                  ),
                ),
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "cancel".tr,
                        width: 142.83.w,
                        backgroundColor: red,
                      ),
                      CustomButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SelectApartment()));
                        },
                        text: "next".tr,
                        width: 142.83.w,
                        backgroundColor: green,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
