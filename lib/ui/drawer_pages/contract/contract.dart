import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/ui/drawer_pages/contract/contract_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Contract extends GetView<ContractController> {
  const Contract({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ContractController());
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: controller.contractKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "contract".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: false,
            )
          ],
        ),
        body: SafeArea(
          child: Container(
                padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                width: width,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: 35.h,
                    width: width,
                    color: greyLite.withOpacity(0.6),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Align(
                      alignment: LocalStorage.languageSelected == "ar"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text("contract data".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.h)),
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
                                  horizontal: 8.w, vertical: 5.h),
                              child: Text("contract number".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15.h)),
                            ),
                            Text("3001576412",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: greyDark, fontSize: 15.h)),
                            Text("contract cost".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h)),
                            Text("100\$",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: greyDark, fontSize: 15.h)),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 5.h),
                              child: Text("beginning of the contract".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15.h)),
                            ),
                            Text(
                              "06-5-2014".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: greyDark,
                                fontSize: 15.h,
                              ),
                            ),
                            Text("end of the contract".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15.h,
                                )),
                            Text("06-5-2014",
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
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    height: 35.h,
                    width: width,
                    color: greyLite.withOpacity(0.6),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Align(
                      alignment: LocalStorage.languageSelected == "ar"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text("tenant data".tr,
                          style: TextStyle(fontSize: 16.h)),
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
                                  horizontal: 8.w, vertical: 5.h),
                              child: Text("name".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15.h)),
                            ),
                            Text("سعيد الاسعد",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: greyDark, fontSize: 15.h)),
                            Text("national id".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h)),
                            Text("46811484",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: greyDark, fontSize: 15.h)),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 5.h),
                              child: Text("nationality".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15.h)),
                            ),
                            Text(
                              "الإمارات".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: greyDark,
                                fontSize: 15.h,
                              ),
                            ),
                            Text("mobile number".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15.h,
                                )),
                            Text("4984894",
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
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    height: 35.h,
                    width: width,
                    color: greyLite.withOpacity(0.6),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Align(
                      alignment: LocalStorage.languageSelected == "ar"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text("estate company data".tr,
                          style: TextStyle(fontSize: 16.h)),
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
                                  horizontal: 8.w, vertical: 5.h),
                              child: Text("name".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15.h)),
                            ),
                            Text("شركة ممدوح",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: greyDark, fontSize: 15.h)),
                            Text("mediator name".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h)),
                            Text("محمد الأحمد",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: greyDark, fontSize: 15.h)),
                          ]),
                          TableRow(children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 5.h),
                                child: Text("commercial register no".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 13.h))),
                            Text("02155".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: greyDark,
                                  fontSize: 15.h,
                                )),
                            Text("estate address".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15.h,
                                )),
                            Text("الشارقة",
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
                  SizedBox(
                    height: 75.h,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: "eviction".tr,
                    width: 210.w,
                    backgroundColor: primaryColor,
                  )
                ])
                //     .toList(),
                ),
          ),
        );
  }
}
