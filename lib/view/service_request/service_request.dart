import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/cancel_request/cancel_request.dart';
import 'package:repair_app/view/not_maintained/not_maintained.dart';
import 'package:repair_app/view/requst_done/request_done.dart';
import 'package:repair_app/view/select_date_time/select_date_time.dart';
import 'package:repair_app/view/service_request/service_request_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class ServiceRequest extends GetView<ServiceRequestController> {
  const ServiceRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ServiceRequestController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const int role = 1;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.serviceRequestKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "service request".tr,
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
                serviceRequestItem(),
                const Divider(
                  color: greyDark,
                  thickness: 1,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomEditText(
                  width: 375.w,
                  inputType: TextInputType.multiline,
                  labelText: "problem".tr,
                  hintText: role == 0
                      ? "problem explanation text".tr
                      : "write description of problem".tr,
                  textEditingController: controller.problemController,
                  lines: role == 2 ? 7 : 1,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                      width: 375.w,
                      height: 45.h,
                      child: Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                controller.formatTime(controller.position.value),
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.w),
                              ),
                            ),
                            SizedBox(
                              width: controller.isDeleted.value ?  200.w : 180.w,
                              child: SliderTheme(
                                data: SliderThemeData(
                                    //       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                                    overlayShape:
                                        SliderComponentShape.noOverlay),
                                child: Slider(
                                  min: 0,
                                  max: controller.duration.value.inSeconds
                                      .toDouble(),
                                  value: controller.position.value.inSeconds
                                      .toDouble(),
                                  activeColor: primaryColor,
                                  inactiveColor: greyDrawer,
                                  onChanged: (value) async {
                                    final position =
                                        Duration(seconds: value.toInt());
                                    await controller.audioPlaying
                                        .seek(position);
                                    await controller.audioPlaying.resume();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                controller.formatTime(
                                    controller.duration.value -
                                        controller.position.value),
                                style: TextStyle(color: primaryColor, fontSize: 15.w),
                              ),
                            ),
                          InkWell(
                                  onTap: () async {
                                    if (controller.isPlaying.value) {
                                      await controller.audioPlaying.pause();
                                    } else {
                                      await controller.audioPlaying.resume();
                                    }
                                  },
                                  child: Icon(
                                    controller.isPlaying.value
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.blueGrey,
                               size: 35.h,
                                  )),

                            Visibility(
                              visible: controller.isDeleted.value ? false : true,
                              child: InkWell(
                                onTap: () async {
                                  if (controller.recorder.value.isRecording) {
                                    await controller.setAudio();
                                  } else {
                                    await controller.record();
                                  }
                                },
                                child: controller.isRecord.value
                                    ? Icon(
                                        Icons.circle,
                                        size: 20.w,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.mic,
                                        size: 20.w,
                                        color: primaryColor,
                                      ),
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                child: InkWell(
                                  child: const Icon(Icons.delete, color: Colors.red, ),
                                  onTap: () async {
                                    await controller.deleteAudio();
                                  },
                                ),
                                visible:
                                    controller.isDeleted.value ? true : false,
                              ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: greyVeryDark))),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 375.w,
                  child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 85.w,
                                height: 85.h,
                                child: Image.asset(
                                  mobile,
                                  width: 70.w,
                                  height: 70.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: greyVeryDark))),
                            Container(
                                width: 85.w,
                                height: 85.h,
                                child: Image.asset(
                                  mobile,
                                  width: 70.w,
                                  height: 70.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: greyVeryDark))),
                            Container(
                                width: 85.w,
                                height: 85.h,
                                child: Image.asset(
                                  mobile,
                                  width: 70.w,
                                  height: 70.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: greyVeryDark))),
                            Container(
                                width: 85.w,
                                height: 85.h,
                                child: role == 0
                                    ? Image.asset(
                                        mobile,
                                        width: 70.w,
                                        height: 70.h,
                                      )
                                    : Column(
                                        children: [
                                          SizedBox(
                                            child: Icon(
                                              Icons.camera_alt,
                                              size: 65.w,
                                              color: primaryColor,
                                            ),
                                            height: 66.h,
                                          ),
                                          SizedBox(
                                            child: Text(
                                              "photo shoot".tr,
                                              style: TextStyle(
                                                  fontSize: 11.h,
                                                  color: greyDark),
                                            ),
                                            height: 15.h,
                                          )
                                        ],
                                      ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: greyVeryDark))),
                          ])),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Visibility(
                  visible: role == 1 ? true : false,
                  child: Divider(
                    color: greyDark,
                    thickness: 1,
                  ),
                ),
                Visibility(
                    child: Text(
                  "payment method".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21.h,
                      color: primaryColor),
                )),
                Visibility(
                    child: Text(
                  "cash".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.h,
                      color: greyDark),
                )),
                const Spacer(),
                if (role == 0)
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CancelRequest()));
                          },
                          text: "reject request".tr,
                          width: 142.83.w,
                          backgroundColor: red,
                        ),
                        CustomButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SelectDateTime()));
                          },
                          text: "confirm request".tr,
                          width: 142.83.w,
                          backgroundColor: green,
                        )
                      ],
                    ),
                  )
                else if (role == 1)
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const NotMaintained()));
                          },
                          text: "not done".tr,
                          width: 142.83.w,
                          backgroundColor: red,
                        ),
                        CustomButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DoneRequest()));
                          },
                          text: "done".tr,
                          width: 142.83.w,
                          backgroundColor: green,
                        )
                      ],
                    ),
                  )
                else
                  Center(
                    child: CustomButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CancelRequest()),
                        );
                        Get.dialog(AlertDialog(
                          backgroundColor: greenWhite,
                          content: SizedBox(
                            height: 175.h,
                            width: 325.w,
                            child: Column(
                              children: [
                                SvgPicture.asset(check),
                                Text(
                                  "The request has been confirmed successfully\nService availability times will be sent"
                                      .tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.h, color: primaryColor),
                                )
                              ],
                            ),
                          ),
                        ));
                      },
                      text: "request confirm".tr,
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
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    "service date".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.h,
                        color: primaryColor,
                        fontWeight: LocalStorage.languageSelected == "ar"
                            ? FontWeight.bold
                            : FontWeight.w500),
                  ),
                ),
                Text(
                  "13/1/2021 | 4:45",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.h, color: greyDark),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
