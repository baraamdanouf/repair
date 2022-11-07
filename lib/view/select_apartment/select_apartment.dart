import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';
import 'package:repair_app/view/select_apartment/select_apartment_controller.dart';
import 'package:repair_app/view/service_request/service_request.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class SelectApartment extends GetView<SelectApartmentController> {
  const SelectApartment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SelectApartmentController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.selectApartmentKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "select apartment".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: false,
            )
          ],
        ),
        body: Container(
            width: width,
            height: height,
            margin: EdgeInsets.only(top: 10.h, bottom: 70.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child:
                  SingleChildScrollView(
                    child: Column(children: [
                      apartmentItem(apartmentNo: 101, value: 0),
                      apartmentItem(apartmentNo: 803, value: 1),
                    ]),
                  ),
                ),
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "cancel".tr,
                        width: 142.83.w,
                        backgroundColor: red,
                      ),
                      CustomButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServiceRequest()));
                        },
                        text: "next".tr,
                        width: 142.83.w,
                        backgroundColor: green,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget apartmentItem({int? apartmentNo, int? value}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
                child: Transform.scale(
                  scale: 1.2,
                  child: Obx(
                    () => Radio(
                      onChanged: (value) {
                        controller.onChangeService(value);
                      },
                      value: value!,
                      groupValue: controller.selectedApartment.value,
                      fillColor: MaterialStateProperty.all(primaryColor),
                      activeColor: primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                apartmentNo.toString(),
                style: TextStyle(
                    color: primaryColor,
                    height: LocalStorage.languageSelected == "ar" ? 0.h : 1.9.h,
                    fontWeight: LocalStorage.languageSelected == "ar"
                        ? FontWeight.bold
                        : FontWeight.w500,
                    fontSize: 18.h),
              ),
            ],
          ),
        ),
        const Divider(
          color: secondaryColor,
          thickness: 1,
        )
      ],
    );
  }
}
