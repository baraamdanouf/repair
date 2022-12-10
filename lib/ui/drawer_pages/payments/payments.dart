import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/ui/drawer_pages/first_payment/first_payment.dart';
import 'package:repair_app/ui/drawer_pages/payments/payments_controller.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Payments extends GetView<PaymentsController> {
  const Payments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentsController());

    final width = MediaQuery.of(context).size.width;
    return DoubleBack(
      message: "Press again BACK to exit".tr,
      background: primaryColor,
      textStyle: const TextStyle(color: Colors.white),
      child: Scaffold(
        key: controller.paymentsKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: false,
              isFilter: false,
              text: "payments".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: true,
            )
          ],
        ),
        body: SafeArea(
          child: Container(
                padding: EdgeInsets.only(top: 10.h),
                width: width,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "my contract list".tr,
                    style: TextStyle(fontSize: 25.h),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: LocalStorage.languageSelected == "ar" ? 35.h : 50.h,
                    width: width,
                    color: greyLite.withOpacity(0.6),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Text("contract number".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.h)),
                          width: 75.w,
                        ),
                        SizedBox(
                          width: 75.w,
                          child: Text("type of contract".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.h)),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                const FirstPayment(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 75.w,
                            child: Text("first payment".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.h)),
                          ),
                        ),
                        SizedBox(
                          width: 75.w,
                          child: Text("other payments".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.h)),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      color: blueBackground,
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                            color: Colors.grey,
                            width: 1.w,
                            borderRadius: BorderRadius.circular(5.r)),
                        columnWidths: const {
                          0: FractionColumnWidth(0.30),
                          1: FractionColumnWidth(0.20),
                          2: FractionColumnWidth(0.25),
                          3: FractionColumnWidth(0.25)
                        },
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 12.h),
                              child: Text("lease contract number".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15.h)),
                            ),
                            Text("type of contract".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h)),
                            Text("first payment".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h)),
                            Text("other payments".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h)),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 12.h),
                              child: Text("300001576412",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 15.h,
                                      decoration: TextDecoration.underline)),
                            ),
                            Text("residential".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                            Text("1000",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                            Text("8000",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 12.h),
                              child: Text("300001576412",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 15.h,
                                      decoration: TextDecoration.underline)),
                            ),
                            Text("residential".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                            Text("3200",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                            Text("12000",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 12.h),
                              child: Text("300001576412",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 15.h,
                                      decoration: TextDecoration.underline)),
                            ),
                            Text("residential".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                            Text("850",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                            Text("6550",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                ))
                          ]),
                        ],
                      ),
                    ),
                  ),
                ])),
          ),
        ),
    );
  }
}
