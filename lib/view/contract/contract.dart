import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/contract/contract_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Contract extends GetView<ContractController> {
  const Contract({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ContractController());

    final width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
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
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.only(top: 40.h),
                width: width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 35.h,
                        width: width,
                        color: greyLite.withOpacity(0.6),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 20.w),
                        child: Text("contract data".tr,
                            style: TextStyle(fontSize: 16.h)),
                      ),
                      Center(
                        child: SizedBox(
                          width: 405.w,
                          child: DataTable(
                            dataRowHeight: 40.h,
                            columnSpacing: 25.w,
                            headingRowHeight: 40.h,
                            decoration:
                                const BoxDecoration(color: blueBackground),
                            border: TableBorder.all(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                            columns: [
                              DataColumn(
                                  label: Text(
                                "contract number".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h),
                              )),
                              DataColumn(
                                  label: Text(
                                "300001576412",
                                style: TextStyle(
                                    color: greyDark,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )),
                              DataColumn(
                                  label: Text(
                                "contract cost".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h),
                              )),
                              DataColumn(
                                  label: Text(
                                "1000\$",
                                style: TextStyle(
                                    color: greyDark,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(Text(
                                    "beginning of the contract".tr,
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 15.h),
                                  )),
                                  DataCell(
                                    Obx(
                                      () => InkWell(
                                          onTap: () {
                                            controller.onChangeDate(controller.selectedDateStart);
                                          },
                                          child: Text(
                                            DateFormat('dd-MM-yyyy').format(
                                                controller.selectedDateStart.value),
                                            style: TextStyle(
                                                color: greyDark,
                                                fontSize: 14.h,
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ),
                                  ),
                                  DataCell(Text(
                                    "end of the contract".tr,
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 15.h),
                                  )),
                                  DataCell(
                                    Obx(
                                          () => InkWell(
                                          onTap: () {
                                            controller.onChangeDate(controller.selectedDateEnd);
                                          },
                                          child: Text(
                                            DateFormat('dd-MM-yyyy').format(
                                                controller.selectedDateEnd.value),
                                            style: TextStyle(
                                                color: greyDark,
                                                fontSize: 14.h,
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ),),
                                ],
                              ),
                            ],
                            //    rows: controller.getRows(controller.allUsers)
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
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 20.w),
                        child: Text("tenant data".tr,
                            style: TextStyle(fontSize: 16.h)),
                      ),
                      Center(
                        child: SizedBox(
                          width: 405.w,
                          child: DataTable(
                            dataRowHeight: 40.h,
                            columnSpacing: 25.w,
                            headingRowHeight: 40.h,
                            decoration:
                                const BoxDecoration(color: blueBackground),
                            border: TableBorder.all(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                            columns: [
                              DataColumn(
                                  label: Text(
                                "name".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h),
                              )),
                              DataColumn(
                                  label: Text(
                                "سعيد الاسعد",
                                style: TextStyle(
                                    color: greyDark,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )),
                              DataColumn(
                                  label: Text(
                                "national id".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h),
                              )),
                              DataColumn(
                                  label: Text(
                                "46811484",
                                style: TextStyle(
                                    color: greyDark,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(Text(
                                    "nationality".tr,
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 15.h),
                                  )),
                                  DataCell(Text(
                                    "الإمارات",
                                    style: TextStyle(
                                        color: greyDark,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400),
                                  )),
                                  DataCell(Text(
                                    "mobile number".tr,
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 15.h),
                                  )),
                                  DataCell(Text(
                                    "4984894",
                                    style: TextStyle(
                                        color: greyDark,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400),
                                  )),
                                ],
                              ),
                            ],
                            //    rows: controller.getRows(controller.allUsers)
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
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 20.w),
                        child: Text("estate company data".tr,
                            style: TextStyle(fontSize: 16.h)),
                      ),
                      Center(
                        child: SizedBox(
                          width: 405.w,
                          child: DataTable(
                            dataRowHeight: 40.h,
                            columnSpacing: 10.w,
                            headingRowHeight: 40.h,
                            decoration:
                                const BoxDecoration(color: blueBackground),
                            border: TableBorder.all(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                            columns: [
                              DataColumn(
                                  label: Text(
                                "name".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h),
                              )),
                              DataColumn(
                                  label: Text(
                                "شركة ممدوح",
                                style: TextStyle(
                                    color: greyDark,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )),
                              DataColumn(
                                  label: Text(
                                "mediator name".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15.h),
                              )),
                              DataColumn(
                                  label: Text(
                                "محمد الأحمد",
                                style: TextStyle(
                                    color: greyDark,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(Text(
                                    "commercial registration no".tr,
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 15.h),
                                  )),
                                  DataCell(Text(
                                    "02155",
                                    style: TextStyle(
                                        color: greyDark,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400),
                                  )),
                                  DataCell(Text(
                                    "estate address".tr,
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 15.h),
                                  )),
                                  DataCell(Text(
                                    "الشارقة",
                                    style: TextStyle(
                                        color: greyDark,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400),
                                  )),
                                ],
                              ),
                            ],
                            //    rows: controller.getRows(controller.allUsers)
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
          )),
    );
  }
}
