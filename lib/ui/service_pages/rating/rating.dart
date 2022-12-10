import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/ui/service_pages/rating/rating_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Rating extends GetView<RatingController> {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RatingController());
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          Get.delete<RatingController>();
          return true;
        },
        child: Scaffold(
            key: controller.ratingKey,
            appBar: AppBar(
                centerTitle: true,
                toolbarHeight: 200.h,
                elevation: 0,
                actions: [
                  CustomPageContainer(
                      isService: true, text: "set of appointment".tr)
                ]),
            body: SafeArea(
                child: KeyboardVisibilityBuilder(builder: (context, visible) {
              return SingleChildScrollView(
                  physics: visible
                      ? BouncingScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  child: Container(
                      width: width,
                      height: 550.h,
                      margin: EdgeInsets.only(top: 100.h),
                      child: Column(children: [
                        Text(
                          "please rate the service".tr,
                          style: TextStyle(
                              fontSize: 30.h,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: RatingBar.builder(
                            itemSize: 30.w,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            updateOnDrag: true,
                            glowColor: Colors.white,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                            ),
                            unratedColor: greyDark.withOpacity(0.6),
                            initialRating: 0,
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomEditText(
                            width: 375.w,
                            inputType: TextInputType.multiline,
                            labelText: "rating".tr,
                            hintText: "write your review of the service".tr,
                            //          textEditingController: controller.problemController,
                            lines: 5),
                        SizedBox(height: 100.h),
                        CustomButton(
                            onPressed: () {},
                            text: "send".tr,
                            backgroundColor: primaryColor,
                            width: 142.83.w)
                      ])));
            }))));
  }
}
