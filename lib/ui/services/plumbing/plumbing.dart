import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/ui/service_pages/select_apartment/select_apartment.dart';
import 'package:repair_app/ui/services/plumbing/plumbing_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Plumbing extends GetView<PlumbingController> {
  const Plumbing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PlumbingController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: controller.plumbingKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [CustomPageContainer(isService: true, text: "plumbing".tr)]),
        body: SafeArea(
          child: Container(
              width: width,
              height: height,
              margin: EdgeInsets.only(top: 10.h, bottom: 70.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                       Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Theme(
                                child: Obx(
                                  () => Checkbox(
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
                                    fontSize: 22.h),
                              )],
                          ),
                        const Divider(
                          color: greyDark,
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
                                  fontSize: 22.h),
                            )
                          ],
                        ),
                        const Divider(
                          color: greyDark,
                          thickness: 1,
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
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => const SelectApartment(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
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
