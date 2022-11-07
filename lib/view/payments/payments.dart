import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/contract/contract.dart';
import 'package:repair_app/view/first_payment/first_payment.dart';
import 'package:repair_app/view/payments/payments_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Payments extends GetView<PaymentsController> {
  const Payments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentsController());

    final width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
          key: controller.paymentsKey,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 200.h,
            elevation: 0,
            actions: [
              CustomPageContainer(
                isService: true,
                isFilter: false,
                text: "payments".tr,
                isDashboard: false,
                isDashboardIcons: false,
                isDrawer: true,
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.only(top: 10.h),
                width: width,
                //    height: height * 0.65,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "my contract list".tr,
                        style: TextStyle(fontSize: 25.h),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 35.h,
                        width: width,
                        color: greyLite.withOpacity(0.6),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("contract number".tr,
                                style: TextStyle(fontSize: 16.h)),
                            Text("type of contract".tr,
                                style: TextStyle(fontSize: 16.h)),
                            InkWell(
                              onTap: (){  Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const FirstPayment()));},
                              child: Text("first payment".tr,
                                  style: TextStyle(fontSize: 16.h)),
                            ),
                            Text("other payments".tr,
                                style: TextStyle(fontSize: 16.h)),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 405.w,
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          child: DataTable(
                            dataRowHeight: 40.h,
                            columnSpacing: 15.w,
                            headingRowHeight: 40.h,
                            decoration:
                                const BoxDecoration(color: blueBackground),
                            headingTextStyle:
                                TextStyle(color: primaryColor, fontSize: 15.h),
                            dataTextStyle: TextStyle(
                              color: greyDark,
                              fontSize: 13.h,
                            ),
                            border: TableBorder.all(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                            columns: [
                              DataColumn(
                                  label: Text("lease contract number".tr)),
                              DataColumn(label: Text("type of contract".tr)),
                              DataColumn(label: Text("first payment".tr)),
                              DataColumn(label: Text("other payments".tr)),
                            ],
                            rows: const [
                              DataRow(
                                cells: [
                                  DataCell(Text(
                                    "300001576412",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )),
                                  DataCell(Text("سكني")),
                                  DataCell(Text("1000")),
                                  DataCell(Text("8000")),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell( Text(
                                        "300001576412",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                      ),
                                  DataCell(Text("سكني")),
                                  DataCell(Text("3200")),
                                  DataCell(Text("12000")),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(Text(
                                    "300001576412",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )),
                                  DataCell(Text("سكني")),
                                  DataCell(Text("850")),
                                  DataCell(Text("6550")),
                                ],
                              ),
                            ],
                            //    rows: controller.getRows(controller.allUsers)
                          ),
                        ),
                      )
                    ])
                //     .toList(),
                ),
          )),
    );
  }
}
