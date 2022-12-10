import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/ui/drawer_pages/contract/contract.dart';
import 'package:repair_app/ui/drawer_pages/contracts/contracts_controller.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Contracts extends GetView<ContractsController> {
  const Contracts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ContractsController());
    final width = MediaQuery.of(context).size.width;
    return DoubleBack(
      message: "Press again BACK to exit".tr,
      background: primaryColor,
      textStyle: const TextStyle(color: Colors.white),
      child: Scaffold(
        key: controller.contractsKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: false,
              isFilter: false,
              text: "contracts".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: true,
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.only(top: 10.h),
                width: width,
                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "my contract list".tr,
                    style: TextStyle(fontSize: 25.h),
                  ),
                  SizedBox(
                    height: 10.h,
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
                            Text("beginning of the contract".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h)),
                            Text("end of the contract".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h)),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 12.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const Contract(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                child: Text("300001576412",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: green,
                                        fontSize: 15.h,
                                        decoration: TextDecoration.underline)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("residential".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("06-5-2014",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("06-5-2014",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 12.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const Contract(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                child: Text("300001576412",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: green,
                                        fontSize: 15.h,
                                        decoration: TextDecoration.underline)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("residential".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("06-5-2014",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("06-5-2014",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 12.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const Contract(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                child: Text("300001576412",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: green,
                                        fontSize: 15.h,
                                        decoration: TextDecoration.underline)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("residential".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("06-5-2014",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Contract(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("06-5-2014",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: greyDark,
                                    fontSize: 15.h,
                                  )),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
