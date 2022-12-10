import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/ui/service_pages/select_apartment/select_apartment.dart';
import 'package:repair_app/ui/services/conditioning/conditioning_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Conditioning extends GetView<ConditioningController> {
  const Conditioning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ConditioningController());
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: controller.conditioningKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              text: "air conditioning and refrigeration services".tr
            )
          ],
        ),
        body: SafeArea(
          child:  Container(
                width: width,
                height: 550.h,
                margin: EdgeInsets.only(top: 10.h, bottom: 70.h),
                child: Column(children: [
                          serviceItem(
                            service: "the air conditioner is not work".tr,
                            value: 0),
                          serviceItem(
                            service: "the air conditioner is not cooling".tr,
                            value: 1),
                          serviceItem(
                            service: "the air conditioner is coming out smells".tr,
                            value: 2),
                          serviceItem(
                            service:
                                "the air conditioner turns off automatically".tr,
                            value: 3),
                          serviceItem(service: "the air conditioner needs cleaning".tr, value: 4),
                          serviceItem(
                            service: "the air conditioner is coming out sound".tr,value: 5),
                          serviceItem(
                            service: "the air conditioner is leaking water".tr,value: 6),
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
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) => const SelectApartment(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),
                              );},
                            text: "next".tr,
                            width: 142.83.w,
                            backgroundColor: green)]))]
                )),
          ),
        );
  }

  Widget serviceItem({String? service, int? value}) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child:
            InkWell(
              onTap: (){controller.onChangeService(value);},
              child: Row(
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
                  SizedBox(
                    width: 350.w,
                    height: 30.h,
                    child: Align(
                      alignment: LocalStorage.languageSelected == "ar" ? Alignment.centerRight : Alignment.centerLeft,
                      child: Text(
                        service ?? "",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.h),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: greyDark,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
