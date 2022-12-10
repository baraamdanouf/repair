import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/ui/drawer_pages/first_payment/first_payment_controller.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class FirstPayment extends GetView<FirstPaymentController> {
  const FirstPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FirstPaymentController());

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: controller.firstPaymentKey,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 200.h,
        elevation: 0,
        actions: [
          CustomPageContainer(
            isService: true,
            text: "payments".tr)]),
      body: SafeArea(
        child: Container(
              padding: EdgeInsets.only(top: 12.h),
              width: width,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "first payment data".tr,
                  style: TextStyle(fontSize: 25.h),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  color: greyLite.withOpacity(0.6),
                  width: width,
                  height: 55.h,
                  child: TabBar(
                    controller: controller.tabController,
                    tabs: [
                      Tab(
                        text: "check".tr,
                      ),
                      Tab(
                        text: "cash".tr,
                      )
                    ],
                    labelColor: Colors.black,
                    unselectedLabelColor: greyDark,
                    indicatorColor: primaryColor,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  width: width,
                  height: 400.h,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 35.h,
                            width: width,
                            color: greyLite.withOpacity(0.6),
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("bank name".tr + " : ",
                                    style: TextStyle(fontSize: 14.h)),
                                Text("بنك أبو ظبي الإسلامي".tr,
                                    style: TextStyle(
                                        fontSize: 14.h, color: primaryColor)),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text("national id".tr + " : ",
                                    style: TextStyle(fontSize: 14.h)),
                                Text("1000859674",
                                    style: TextStyle(
                                        fontSize: 14.h, color: primaryColor)),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              color: blueBackground,
                              margin: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                border: TableBorder.all(
                                    color: Colors.grey,
                                    width: 1.w,
                                    borderRadius: BorderRadius.circular(5.r)),
                                columnWidths: const {
                                  0: FractionColumnWidth(0.25),
                                  1: FractionColumnWidth(0.25),
                                  2: FractionColumnWidth(0.25),
                                  3: FractionColumnWidth(0.25)
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 10.h),
                                      child: Text("due date".tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 15.h)),
                                    ),
                                    Text("3001576412",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: greyDark, fontSize: 15.h)),
                                    Text("check number".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 15.h)),
                                    Text("356156",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: greyDark, fontSize: 15.h)),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 10.h),
                                      child: Text("check value".tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 15.h)),
                                    ),
                                    Text(
                                      "06-5-2014".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: greyDark,
                                        fontSize: 15.h,
                                      ),
                                    ),
                                    Text("instrument number".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 15.h,
                                        )),
                                    Text("2166",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: greyDark,
                                          fontSize: 15.h,
                                        )),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 35.h),
                          Center(
                            child: Container(
                              color: blueBackground,
                              margin: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                border: TableBorder.all(
                                    color: Colors.grey,
                                    width: 1.w,
                                    borderRadius: BorderRadius.circular(5.r)),
                                columnWidths: const {
                                  0: FractionColumnWidth(0.25),
                                  1: FractionColumnWidth(0.25),
                                  2: FractionColumnWidth(0.25),
                                  3: FractionColumnWidth(0.25)
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 10.h),
                                      child: Text("due date".tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 15.h)),
                                    ),
                                    Text("3001576412",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: greyDark, fontSize: 15.h)),
                                    Text("the value".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 15.h)),
                                    Text("1250",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: greyDark, fontSize: 15.h)),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 10.h),
                                      child: Text("check value".tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 15.h)),
                                    ),
                                    Text(
                                      "06-5-2014".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: greyDark,
                                        fontSize: 15.h,
                                      ),
                                    ),
                                    Text("the value".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 15.h,
                                        )),
                                    Text("2166",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: greyDark,
                                          fontSize: 15.h,
                                        )),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ])
              //     .toList(),
              ),
        ),
    );
  }
}
