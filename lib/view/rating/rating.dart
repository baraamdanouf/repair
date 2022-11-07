import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/view/rating/rating_controller.dart';
import 'package:repair_app/widgets/custom_button.dart';
import 'package:repair_app/widgets/custom_edit_text.dart';
import 'package:repair_app/widgets/custom_page_container.dart';

class Rating extends GetView<RatingController> {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RatingController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        key: controller.appointmentKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 200.h,
          elevation: 0,
          actions: [
            CustomPageContainer(
              isService: true,
              isFilter: false,
              text: "set of appointment".tr,
              isDashboard: false,
              isDashboardIcons: false,
              isDrawer: false,
            )
          ],
        ),
        body: Container(
            width: width,
            height: height,
            margin: EdgeInsets.only(top: 10.h, bottom: 36.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                     Text("please rate the service".tr,style: TextStyle(
                       fontSize: 32.h, color: primaryColor, fontWeight: FontWeight.bold
                     ),),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: RatingBar.builder(
                    itemSize: 38.w,
                    minRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    updateOnDrag: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                    unratedColor: greyDark.withOpacity(0.6),
                    initialRating: 3,
                    onRatingUpdate: (rating) {},
                  ),
                ),
                SizedBox(height: 25.h,),
                CustomEditText(
                  width: 375.w,
                  inputType: TextInputType.multiline,
                  labelText: "rating".tr,
                  hintText: "write your review of the service".tr,
                  textEditingController: controller.problemController,
                  lines: 7,
                ),
                SizedBox(height: 55.h,),
                CustomButton(onPressed: (){}, text: "send".tr, backgroundColor: primaryColor,    width: 142.83.w,),
              ],
            )),
      ),
    );
  }
}
