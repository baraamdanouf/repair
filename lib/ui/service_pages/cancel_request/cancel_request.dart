import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/ui/service_pages/cancel_request/cancel_request_request.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';
import 'package:repair_app/widgets/custom_service.dart';

class CancelRequest extends GetView<CancelRequestController> {
  const CancelRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CancelRequestController());
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Get.delete<CancelRequestController>();
        return true;
      },
      child: Scaffold(
        key: controller.cancelRequestKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              text: "determine the reason for rejection".tr)]),
        body: SafeArea(
          child: KeyboardVisibilityBuilder(builder: (context, visible) {
            return SingleChildScrollView(
              physics:visible
                  ? const BouncingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: Container(
                  width: width,
                  height: 550.h,
                  margin: EdgeInsets.only(top: 10.h, bottom: 70.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomService(),
                      const Divider(
                        color: greyDark,
                        thickness: 1,
                      ),
                      Text(
                        "reason for rejection of request".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24.h,
                            color: primaryColor),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomEditText(
                        width: 375.w,
                        inputType: TextInputType.text,
                        labelText: "problem".tr,
                        hintText: "write a text explaining the reason for rejection".tr,
                        textEditingController: controller.problemController,
                      ),
                      const Spacer(),
                      Center(
                        child: CustomButton(
                          onPressed: () async {},
                          text: "send".tr,
                          width: 142.83.w,
                          backgroundColor: primaryColor,
                        ),
                      ),
                    ],
                  )),
            );
          }),
        ),
      ),
    );
  }
}
