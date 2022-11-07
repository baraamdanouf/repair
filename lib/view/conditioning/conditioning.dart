import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/conditioning/conditioning_controller.dart';
import 'package:repair_app/view/select_apartment/select_apartment.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Conditioning extends GetView<ConditioningController> {
  const Conditioning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ConditioningController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.conditioningKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "air conditioning and refrigeration services".tr,
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
                      serviceItem(
                        service: "the air conditioner is not work".tr,
                        value: 0,
                      ),
                      serviceItem(
                        service: "the air conditioner is not cooling".tr,
                        value: 1,
                      ),
                      serviceItem(
                        service: "the air conditioner is coming out smells".tr,
                        value: 2,
                      ),
                      serviceItem(
                        service:
                            "the air conditioner turns off automatically".tr,
                        value: 3,
                      ),
                      serviceItem(
                        service: "the air conditioner needs cleaning".tr,
                        value: 4,
                      ),
                      serviceItem(
                        service: "the air conditioner is coming out sound".tr,
                        value: 5,
                      ),
                      serviceItem(
                        service: "the air conditioner is leaking water".tr,
                        value: 6,
                      ),
                    ]),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
                        },
                        text: "cancel".tr,
                        width: 142.83.w,
                        backgroundColor: red,
                      ),
                      CustomButton(
                        onPressed: () {

                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectApartment()));
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

  Widget serviceItem({String? service, int? value}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
                child: Transform.scale(
                  scale: 1.2,
                  child: Obx(
                    () => Radio(
                      onChanged: (value) {
                        controller.onChangeService(value);
                      },
                      value: value!,
                      groupValue: controller.selectedService.value,
                      fillColor: MaterialStateProperty.all(primaryColor),
                      activeColor: primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                service ?? "",
                style: TextStyle(
                    color: primaryColor,
                    height: LocalStorage.languageSelected == "ar" ? 0.h : 1.9.h,
                    fontWeight: LocalStorage.languageSelected == "ar"
                        ? FontWeight.bold
                        : FontWeight.w500,
                    fontSize: 18.h),
              ),
            ],
          ),
        ),
        const Divider(
          color: secondaryColor,
          thickness: 1,
        )
      ],
    );
  }
}
