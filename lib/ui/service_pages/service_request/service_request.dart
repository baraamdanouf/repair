import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/ui/service_pages/cancel_request/cancel_request.dart';
import 'package:repair_app/ui/service_pages/cancel_request/cancel_request_request.dart';
import 'package:repair_app/ui/service_pages/not_maintained/not_maintained.dart';
import 'package:repair_app/ui/service_pages/not_maintained/not_maintained_controller.dart';
import 'package:repair_app/ui/service_pages/requst_done/request_done.dart';
import 'package:repair_app/ui/service_pages/requst_done/request_done_controller.dart';
import 'package:repair_app/ui/service_pages/select_date_time/select_date_time.dart';
import 'package:repair_app/ui/service_pages/service_request/service_request_controller.dart';
import 'package:repair_app/ui/service_pages/set_appoinment/set_appoinment.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';
import 'package:repair_app/widgets/custom_service.dart';

class ServiceRequest extends GetView<ServiceRequestController> {
  const ServiceRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ServiceRequestController());
    final width = MediaQuery.of(context).size.width;
    var role = LocalStorage.roleSelected;
    return WillPopScope(
      onWillPop: () async {
        Get.delete<ServiceRequestController>();
        return true;
      },
      child: Scaffold(
          key: controller.serviceRequestKey,
          appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 200.h,
              elevation: 0,
              actions: [
                CustomPageContainer(isService: true, text: "service request".tr)
              ]),
          body: SafeArea(
            child: KeyboardVisibilityBuilder(builder: (context, visible) {
              return SingleChildScrollView(
                physics: visible
                    ? const BouncingScrollPhysics()
                    : NeverScrollableScrollPhysics(),
                child: Container(
                    width: width,
                    height: 550.h,
                    margin: EdgeInsets.only(top: 10.h, bottom: 70.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomService(),
                        const Divider(
                          color: greyDark,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomEditText(
                            width: 375.w,
                            inputType: role == 2
                                ? TextInputType.multiline
                                : TextInputType.text,
                            labelText: "problem".tr,
                            hintText: role == 1
                                ? "problem explanation text".tr
                                : "write description of problem".tr,
                            textEditingController: controller.problemController,
                            lines: role == 2 ? 5 : 1),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.w),
                                      child: Visibility(
                                        visible: controller.isRecord.value
                                            ? false
                                            : true,
                                        child: Text(
                                          controller.formatTime(
                                              controller.position.value),
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 15.w),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
                                      width: controller.isRecord.value
                                          ? 250.w
                                          : 200.w,
                                      child: SliderTheme(
                                        data: SliderThemeData(
                                            thumbShape: RoundSliderThumbShape(
                                                enabledThumbRadius: 8.r,
                                                elevation: 0,
                                                pressedElevation: 0,
                                                disabledThumbRadius: 8.r),
                                            overlayShape:
                                                SliderComponentShape.noOverlay,
                                            disabledThumbColor: primaryColor),
                                        child: Slider(
                                          min: 0,
                                          max: controller
                                              .duration.value.inSeconds
                                              .toDouble(),
                                          value: controller
                                              .position.value.inSeconds
                                              .toDouble(),
                                          autofocus: false,
                                          activeColor: primaryColor,
                                          inactiveColor: greyDrawer,
                                          thumbColor: primaryColor,
                                          onChanged: (value) async {
                                            final position = Duration(
                                                seconds: value.toInt());
                                            await controller.audioPlaying
                                                .seek(position);
                                            await controller.audioPlaying
                                                .resume();
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: controller.isRecord.value
                                          ? StreamBuilder<RecordingDisposition>(
                                              stream: controller
                                                  .recorder.value.onProgress,
                                              builder: (context, snapshot) {
                                                final duration = snapshot
                                                        .hasData
                                                    ? snapshot.data!.duration
                                                    : Duration.zero;
                                                return Text(
                                                    controller
                                                        .formatTime(duration),
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 15.w));
                                              },
                                            )
                                          : Text(
                                              controller.formatTime(controller
                                                      .duration.value -
                                                  controller.position.value),
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 15.w)),
                                    ),
                                    Visibility(
                                      visible: controller.isRecord.value
                                          ? false
                                          : true,
                                      child: InkWell(
                                          onTap: () async {
                                            if (controller.isPlaying.value) {
                                              await controller.audioPlaying
                                                  .pause();
                                            } else {
                                              await controller.audioPlaying
                                                  .resume();
                                            }
                                          },
                                          child: Icon(
                                            controller.isPlaying.value
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: Colors.blueGrey,
                                            size: 35.h,
                                          )),
                                    ),
                                    Visibility(
                                      visible: controller.isDeleted.value ||
                                              role == 1 ||
                                              role == 0
                                          ? false
                                          : true,
                                      child: InkWell(
                                        onTap: () async {
                                          if (controller
                                              .recorder.value.isRecording) {
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
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onTap: () async {
                                            await controller.deleteAudio();
                                          },
                                        ),
                                        visible: controller.isDeleted.value
                                            ? true
                                            : false,
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
                        role == 0 || role == 1
                            ? SizedBox(
                                height: 85.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  reverse: true,
                                  itemCount: 4,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Container(
                                              width: 85.w,
                                              height: 85.h,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Image.asset(mobile),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: greyVeryDark))),
                                ),
                              )
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 85.w,
                                          height: 85.h,
                                          margin: EdgeInsets.only(left: 5.w),
                                          child: InkWell(
                                            onTap: () {
                                              Get.bottomSheet(
                                                  SizedBox(
                                                    height: 170.h,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(20.h),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "choose photo from"
                                                                .tr,
                                                            style: TextStyle(
                                                                fontSize: 20.h,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    primaryColor),
                                                          ),
                                                          SizedBox(
                                                            height: 20.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              InkWell(
                                                                child: Column(
                                                                    // mainAxisAlignment:
                                                                    //     MainAxisAlignment
                                                                    //         .start,
                                                                    children: [
                                                                      Icon(
                                                                        CupertinoIcons
                                                                            .camera_fill,
                                                                        color:
                                                                            primaryColor,
                                                                        size: 44
                                                                            .h,
                                                                      ),
                                                                      Text(
                                                                          "camera"
                                                                              .tr,
                                                                          style:
                                                                              TextStyle(fontSize: 15.h)),
                                                                    ]),
                                                                onTap: () {
                                                                  controller.takePhoto(
                                                                      ImageSource
                                                                          .camera);
                                                                },
                                                              ),
                                                              InkWell(
                                                                child: Column(
                                                                    // mainAxisAlignment:
                                                                    //     MainAxisAlignment
                                                                    //         .center,
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .image,
                                                                          color:
                                                                              primaryColor,
                                                                          size:
                                                                              44.h),
                                                                      Text(
                                                                          "gallery"
                                                                              .tr,
                                                                          style:
                                                                              TextStyle(fontSize: 15.h))
                                                                    ]),
                                                                onTap:
                                                                    () async {
                                                                  await controller
                                                                      .takePhoto(
                                                                          ImageSource
                                                                              .gallery);
                                                                },
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  elevation: 20.0,
                                                  enableDrag: false,
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.r),
                                                    topRight:
                                                        Radius.circular(20.r),
                                                  )));
                                            },
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  child: Icon(
                                                    CupertinoIcons
                                                        .photo_camera_solid,
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
                                          ),
                                          decoration: BoxDecoration(
                                              //borderRadius: BorderRadius.circular(5.r),
                                              border: Border.all(
                                                  color: greyVeryDark))),
                                      Obx(
                                        () => controller.images.isEmpty
                                            ? Container()
                                            : SizedBox(
                                                height: 85.h,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  reverse: true,
                                                  itemCount:
                                                      controller.images.length,
                                                  itemBuilder: (BuildContext
                                                              context,
                                                          int index) =>
                                                      Container(
                                                          width: 85.w,
                                                          height: 85.h,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.w),
                                                          child:
                                                              // controller.isLoading.value == true ? Transform.scale(
                                                              //          scale: 0.3,
                                                              //          child: CircularProgressIndicator(color: primaryColor, strokeWidth: 10.w,  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange), ),
                                                              //        ):
                                                              Image.file(
                                                            File(controller
                                                                .images[index]),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      greyVeryDark))),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Visibility(
                          visible: role == 1 ? true : false,
                          child: Divider(
                            color: greyDark,
                            thickness: 1,
                          ),
                        ),
                        Visibility(
                            visible: role == 1 ? true : false,
                            child: Text(
                              "payment method".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.h,
                                  color: primaryColor),
                            )),
                        Visibility(
                            visible: role == 1 ? true : false,
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
                                    Get.delete<CancelRequestController>();
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const CancelRequest(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  text: "reject request".tr,
                                  width: 142.83.w,
                                  backgroundColor: red,
                                ),
                                CustomButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const SelectDateTime(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
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
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //     builder: (context) => const NotMaintained()));
                                    Get.delete<NotMaintainedController>();
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const NotMaintained(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  text: "not done".tr,
                                  width: 142.83.w,
                                  backgroundColor: red,
                                ),
                                CustomButton(
                                  onPressed: () {
                                    Get.delete<DoneRequestController>();
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const DoneRequest(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
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
                                //     Get.put(ServiceRequestController(),permanent: true);
                                //    Get.lazyPut(() => ServiceRequestController(), fenix: true);
                                //     await Get.delete<ServiceRequestController>(force: true,);
                                //   ServiceRequestController().update();
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Appointment(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                                await Get.dialog(AlertDialog(
                                  backgroundColor: greenWhite,
                                  content: SizedBox(
                                    height: 175.h,
                                    width: 250.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(check),
                                        Center(
                                          child: Text(
                                            "The request has been confirmed successfully \nService availability times will be sent"
                                                .tr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 17.h,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w500),
                                          ),
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
              );
            }),
          )),
    );
  }
}
