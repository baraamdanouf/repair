import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/ui/service_pages/requst_done/request_done_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';
import 'package:repair_app/widgets/custom_service.dart';

class DoneRequest extends GetView<DoneRequestController> {
  const DoneRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DoneRequestController());
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
      Get.delete<DoneRequestController>();
      return true;
      },
      child: Scaffold(
          key: controller.doneRequestKey,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 200.h,
            elevation: 0,
            actions: [
              CustomPageContainer(
                isService: true,
                text: "done request".tr,
              )]),
          body: SafeArea(
            child:  KeyboardVisibilityBuilder(builder: (context, visible) {
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
                          inputType: TextInputType.multiline,
                          labelText: "problem".tr,
                          hintText: "write your notes".tr,
                          textEditingController: controller.problemController,
                          //   lines: 1
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "attach photos of the process".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.h,
                              color: primaryColor
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 25.w),
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
                                                padding: EdgeInsets.all(20.h),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "choose photo from".tr,
                                                      style: TextStyle(
                                                          fontSize: 20.h,
                                                          fontWeight:
                                                          FontWeight.w600,
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
                                                                  size: 44.h,
                                                                ),
                                                                Text(
                                                                    "camera"
                                                                        .tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        15.h)),
                                                              ]),
                                                          onTap: () {
                                                            controller
                                                                .takePhoto(
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
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        15.h))
                                                              ]),
                                                          onTap: () async {
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
                                                  topLeft: Radius.circular(
                                                      20.r),
                                                  topRight: Radius.circular(
                                                      20.r),
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
                                        border:
                                        Border.all(color: greyVeryDark))),
                                Obx(
                                      () =>
                                  controller.images.isEmpty
                                      ? Container()
                                      : SizedBox(
                                    height: 85.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      reverse: true,
                                      itemCount:
                                      controller.images.length,
                                      itemBuilder: (BuildContext
                                      context,
                                          int index) =>
                                          Container(
                                              width: 85.w,
                                              height: 85.h,
                                              margin:
                                              EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child:
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
                        const Spacer(),
                        Center(
                          child: CustomButton(
                            onPressed: () async {},
                            text: "send".tr,
                            width: 142.83.w,
                            backgroundColor: green,
                          ),
                        ),
                      ],
                    )),
              );
            }),
          ),
      ),
    );
  }
}
