import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/first_payment/first_payment_controller.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

 class FirstPayment extends GetView<FirstPaymentController> {
   const FirstPayment({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     Get.put(FirstPaymentController());

     final width = MediaQuery
         .of(context)
         .size
         .width;
     return ScreenUtilInit(
       designSize: const Size(428, 926),
       minTextAdapt: true,
       splitScreenMode: true,
       builder: (context, child) =>
           Scaffold(
               key: controller.firstPaymentKey,
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
                     isDrawer: false,
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
                             "first payment data".tr,
                             style: TextStyle(fontSize: 25.h),
                           ),
                           SizedBox(height: 8.h,),
                           Container(
                             color: greyLite.withOpacity(0.6),
                             width: width,
                             height: 55.h,
                             child: TabBar(
                                 controller: controller.tabController,
                                 tabs: controller.listTabs,
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
                             height: 500.h,
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
                                                      color: primaryColor,
                                                      fontSize: 15.h),
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
                                                      color: primaryColor,
                                                      fontSize: 15.h),
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
                                                      color: primaryColor,
                                                      fontSize: 15.h),
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
                                                      color: primaryColor,
                                                      fontSize: 15.h),
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
                                  ],
                                )  ,
                                 Column(
                                   children: [
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
                                                       color: primaryColor,
                                                       fontSize: 15.h),
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
                                                       color: primaryColor,
                                                       fontSize: 15.h),
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
                                                       color: primaryColor,
                                                       fontSize: 15.h),
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
                                                       color: primaryColor,
                                                       fontSize: 15.h),
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
                                   ],
                                 )  ,
                               ],
                             ),
                           ),
                           SizedBox(
                             height: 20.h,
                           ),

                         ])
                   //     .toList(),
                 ),
               )),
     );
   }
 }
