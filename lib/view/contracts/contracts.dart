import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/contract/contract.dart';
import 'package:repair_app/view/contracts/contracts_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Contracts extends GetView<ContractsController> {
  const Contracts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ContractsController());
    final width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
          key: controller.contractsKey,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 200.h,
            elevation: 0,
            actions: [
              CustomPageContainer(
                isService: true,
                isFilter: false,
                text: "contracts".tr,
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "my contract list".tr,
                        style: TextStyle(fontSize: 25.h),
                      ),
                      Center(
                        child: Container(
                          width: 405.w,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 15.w),
                          child: DataTable(
                            dataRowHeight: 40.h,
                            columnSpacing: 25.w,
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
                              DataColumn(
                                  label: Text("beginning of the contract".tr)),
                              DataColumn(label: Text("end of the contract".tr)),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(InkWell(
                                    child: const Text(
                                      "300001576412",
                                      style: TextStyle(
                                          color: Colors.green,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  )),
                                  DataCell(
                                    const InkWell(child: Text("سكني")),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  ),
                                  DataCell(
                                    const InkWell(child: Text("06-5-2014")),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  ),
                                  DataCell(InkWell(
                                    child: const Text("06-5-2022"),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  )),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(InkWell(
                                    child: const Text(
                                      "300001576412",
                                      style: TextStyle(
                                          color: Colors.green,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  )),
                                  DataCell(
                                    const InkWell(child: Text("سكني")),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  ),
                                  DataCell(
                                    const InkWell(child: Text("06-5-2014")),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  ),
                                  DataCell(InkWell(
                                    child: const Text("06-5-2022"),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  )),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(InkWell(
                                    child: const Text(
                                      "300001576412",
                                      style: TextStyle(
                                          color: Colors.green,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  )),
                                  DataCell(
                                    const InkWell(child: Text("سكني")),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  ),
                                  DataCell(
                                    const InkWell(child: Text("06-5-2014")),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                    },
                                  ),
                                  DataCell(InkWell(
                                    child: const Text("06-5-2022"),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Contract()));
                                      //       Navigator.pushNamed(context, 'contract');
                                    },
                                  )),
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
