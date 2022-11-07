import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/bill/bill_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Bill extends GetView<BillController> {
  const Bill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BillController());

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
          key: controller.billKey,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 200.h,
            elevation: 0,
            actions: [
              CustomPageContainer(
                isService: true,
                isFilter: false,
                text: "bill".tr,
                isDashboard: false,
                isDashboardIcons: false,
                isDrawer: false,
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: KeyboardVisibilityBuilder(
              builder: (context, visible) => Container(
                width: width,
                height: visible ? height - 200.h : height - 320.h,
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 25.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "material".tr,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.h),
                                ),
                                Container(
                                    width: 150.w,
                                    child: TextField(
                                        controller:
                                            controller.materialController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText:
                                              'enter the material type'.tr,
                                          labelStyle: TextStyle(
                                              color: greyDark, fontSize: 18.h),
                                        ))),
                              ],
                            ),
                          ),
                          const Divider(
                            color: greyDark,
                            thickness: 1.3,
                          ),
                          SizedBox(
                            height: 25.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "quantity".tr,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.h),
                                ),
                                Container(
                                    width: 150.w,
                                    child: TextFormField(
                                        autofocus: false,
                                        controller:
                                            controller.quantityController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'quantity determine'.tr,
                                          labelStyle: TextStyle(
                                              color: greyDark, fontSize: 18.h),
                                        ))),
                              ],
                            ),
                          ),
                          const Divider(
                            color: greyDark,
                            thickness: 1.3,
                          ),
                          SizedBox(
                            height: 25.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "individual".tr,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.h),
                                ),
                                Container(
                                    width: 150.w,
                                    child: TextFormField(
                                        autofocus: false,
                                        controller:
                                            controller.individualController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText:
                                              'enter the individual price'.tr,
                                          labelStyle: TextStyle(
                                              color: greyDark, fontSize: 18.h),
                                        ))),
                              ],
                            ),
                          ),
                          const Divider(
                            color: greyDark,
                            thickness: 1.3,
                          ),
                          SizedBox(
                            height: 25.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "total".tr,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.h),
                                ),
                                Container(
                                    width: 150.w,
                                    child: TextFormField(
                                        autofocus: false,
                                        controller: controller.totalController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'enter the total price'.tr,
                                          labelStyle: TextStyle(
                                              color: greyDark, fontSize: 18.h),
                                        ))),
                              ],
                            ),
                          ),
                          const Divider(
                            color: greyDark,
                            thickness: 1.3,
                          ),
                          SizedBox(
                            height: 25.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "statement".tr,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.h),
                                ),
                                Container(
                                    width: 150.w,
                                    child: TextFormField(
                                        autofocus: false,
                                        controller:
                                            controller.statementController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'write the statement'.tr,
                                          //  hintText: 'write the statement'.tr,
                                          labelStyle: TextStyle(
                                              color: greyDark, fontSize: 18.h),
                                        ))),
                              ],
                            ),
                          ),
                          const Divider(
                            color: greyDark,
                            thickness: 1.3,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: greyDark,
                      thickness: 1.3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 25.h,
                                child: Text(
                                  "material".tr,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 20.h),
                                ),
                              ),
                              Text(
                                "مغسلة",
                                style:
                                    TextStyle(color: greyDark, fontSize: 18.h),
                              )
                            ],
                          ),
                          SizedBox(
                              width: 20.w,
                              height: 45.h,
                              child: const VerticalDivider(
                                  color: greyDark, thickness: 2, width: 5)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 25.h,
                                child: Text(
                                  "quantity".tr,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 20.h),
                                ),
                              ),
                              Text(
                                "10",
                                style: TextStyle(
                                    color: greyDark,
                                    fontSize: 18.h,
                                    height: 1.5),
                              )
                            ],
                          ),
                          SizedBox(
                              width: 20.w,
                              height: 45.h,
                              child: const VerticalDivider(
                                  color: greyDark, thickness: 2, width: 5)),
                          Column(
                            children: [
                              SizedBox(
                                height: 30.h,
                                child: Text(
                                  "individual".tr,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 20.h),
                                ),
                              ),
                              Text(
                                "300",
                                style: TextStyle(
                                    color: greyDark,
                                    fontSize: 18.h,
                                    height: 1.5),
                              )
                            ],
                          ),
                          SizedBox(
                              width: 20.w,
                              height: 45.h,
                              child: const VerticalDivider(
                                  color: greyDark, thickness: 2, width: 5)),
                          Column(
                            children: [
                              SizedBox(
                                height: 30.h,
                                child: Text(
                                  "total".tr,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 20.h),
                                ),
                              ),
                              Text(
                                "3000",
                                style:
                                    TextStyle(color: greyDark, fontSize: 18.h),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomEditText(
                      width: 375.w,
                      inputType: TextInputType.multiline,
                      labelText: "statement".tr,
                      hintText: "explanation of the statement".tr,
                      textEditingController: controller.problemController,
                      lines: 1,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      color: greyDark,
                      thickness: 1.3,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: Container(
                        width: 33.w,
                        height: 33.h,
                        decoration: const BoxDecoration(
                            color: green, shape: BoxShape.circle),
                        child: Icon(
                          Icons.add,
                          size: 27.h,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: CustomButton(
                        onPressed: () async {},
                        text: "next".tr,
                        width: 142.83.w,
                        backgroundColor: green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

          // Container(
          //     padding: EdgeInsets.only(top: 10.h),
          //     width: width,
          //     child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Container(
          //           //  width:400.w,
          //             child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(
          //                   "one month".tr,
          //                   style: TextStyle(
          //                       color:primaryColor,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 18.h),
          //                 ),
          //              SizedBox(
          //                width: 200.w,
          //                child: TextField(
          //                     controller: controller.problemController,
          //                        textInputAction: TextInputAction.next,
          //                        decoration: InputDecoration(
          //                        border: InputBorder.none,
          //                            label: Text(
          //                              'Address1*'.tr,
          //                              style: const TextStyle(
          //                                  color: primaryColor),
          //                            )),
          //                      ),
          //              ),
          //                  SizedBox(
          //                    height: 16.h,
          //                  ),
          //               ],
          //             ),
          //             height: 25.h,
          //           ),
          //           Divider(
          //             color: greyDark,
          //             thickness: 1.3,
          //           ),
          //         ])
          //   //     .toList(),
          // ),
          ),
    );
  }
}
