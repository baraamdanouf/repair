import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/ui/service_pages/rating/rating.dart';
import 'package:repair_app/ui/service_pages/rating/rating_controller.dart';
import 'package:repair_app/ui/service_pages/set_appoinment/set_oppoinment_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';
import 'package:repair_app/widgets/custom_service.dart';

class Appointment extends GetView<AppointmentController> {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppointmentController());
    final width = MediaQuery.of(context).size.width;
    return
        //   WillPopScope(
        //   onWillPop: () async {
        // Get.delete<ServiceRequestController>();
        //    Get.find<ServiceRequestController>();
        //  Get.delete<AppointmentController>();
        //    Get.delete<ServiceRequestController>();
        //    ServiceRequestController().update();
        //   Get.put(ServiceRequestController(), permanent: true);
        //   return true;
        //   },
        //     child:
        Scaffold(
            key: controller.appointmentKey,
            appBar: AppBar(
                centerTitle: true,
                toolbarHeight: 200.h,
                elevation: 0,
                actions: [
                  CustomPageContainer(
                      isService: true, text: "set of appointment".tr)
                ]),
            body: SafeArea(
                child: Container(
                    width: width,
                    //  height: 570.h,
                    margin: EdgeInsets.only(top: 10.h, bottom: 36.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomService(),
                        const Divider(
                          color: greyDark,
                          thickness: 1,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 27.w),
                          child: Column(
                            children: [
                              Text(
                                "please choose the appropriate date for you".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24.h,
                                    color: primaryColor),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              timeItem(
                                  time:
                                      "4 كانون الثاني2000 | من 10:14 إلى 10:14 ",
                                  value: 0),
                              const Divider(
                                color: greyDark,
                                thickness: 1,
                              ),
                              timeItem(
                                  time:
                                      "4 كانون الثاني2000 | من 10:14 إلى 10:14 ",
                                  value: 1),
                              const Divider(
                                color: greyDark,
                                thickness: 1,
                              ),
                              timeItem(
                                  time:
                                      "4 كانون الثاني2000 | من 10:14 إلى 10:14 ",
                                  value: 2),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Divider(
                          color: greyDark,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 38.h,
                          width: 100.w,
                          child: Row(
                            children: [
                              Text(
                                "cost : ".tr,
                                style: TextStyle(
                                    fontWeight:
                                        LocalStorage.languageSelected == "ar"
                                            ? FontWeight.bold
                                            : FontWeight.w500,
                                    fontSize: 24.h,
                                    color: primaryColor),
                              ),
                              Text(
                                "free".tr,
                                style:
                                    TextStyle(fontSize: 18.h, color: greyDark),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 38.h,
                          width: 100.w,
                          child: Row(
                            children: [
                              Text(
                                "cost : ".tr,
                                style: TextStyle(
                                    fontWeight:
                                        LocalStorage.languageSelected == "ar"
                                            ? FontWeight.bold
                                            : FontWeight.w500,
                                    fontSize: 24.h,
                                    color: primaryColor),
                              ),
                              Text(
                                "350 د.إ".tr,
                                style:
                                    TextStyle(fontSize: 18.h, color: greyDark),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: greyDark,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 35.h,
                          child: Text(
                            "choose your payment method".tr,
                            style: TextStyle(
                                fontWeight:
                                    LocalStorage.languageSelected == "ar"
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                fontSize: 24.h,
                                color: primaryColor),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              paymentItem(value: 0, method: "cash".tr),
                              SizedBox(
                                width: 35.w,
                              ),
                              paymentItem(value: 1, method: "bank card".tr),
                            ]),
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
                                text: "cancel order".tr,
                                width: 142.83.w,
                                backgroundColor: red,
                              ),
                              CustomButton(
                                onPressed: () async {
                                Get.delete<RatingController>();
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const Rating(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                  await Get.dialog(AlertDialog(
                                    backgroundColor: greenWhite,
                                    content: SizedBox(
                                      height: 175.h,
                                      width: 325.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(check),
                                          Text(
                                            "completed successfully".tr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20.h,
                                                color: primaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                                },
                                text: "appointment confirm".tr,
                                width: 142.83.w,
                                backgroundColor: green,
                              )
                            ],
                          ),
                        )
                      ],
                    ))));
  }

  Widget timeItem({String? time, int? value}) {
    return InkWell(
        onTap: () {
          controller.onChangeService(value);
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 25.h,
            child: Transform.scale(
              scale: 1,
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
          Text(time ?? "", style: TextStyle(color: greyDark, fontSize: 18.h))
        ]));
  }

  Widget paymentItem({String? method, int? value}) {
    return InkWell(
      onTap: () {
        controller.onChangePayment(value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
        height: 40.h,
            width: 25.w,
            child: Transform.scale(
              scale: 1,
              child: Obx(
                () => Radio(
                  onChanged: (value) {
                    controller.onChangePayment(value);
                  },
                  value: value!,
                  groupValue: controller.selectedPayment.value,
                  fillColor: MaterialStateProperty.all(primaryColor),
                  activeColor: primaryColor,
                ),
              ),
            ),
          ),
          Text(
            method ?? "",
            style: TextStyle(color: greyDark, fontSize: 18.h),
          ),
        ],
      ),
    );
  }
}
