import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';

class CustomPageContainer extends StatelessWidget {
  final String text;
  final bool isDashboard;
  final bool isFilter;

  const CustomPageContainer({
    Key? key,
    required this.text,
    required this.isDashboard,
    required this.isFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: isDashboard ? height / 3.3 : height / 4.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(fit: StackFit.expand, children: [
        Visibility(
          visible: isFilter,
          child: Positioned(
            left: 356.sp,
            top: 100.sp,
            child: Column(children: [
              Image.asset(
                funnel,
                width: 35.w,
                height: 32.h,
              ),
              Text(
                "فرز حسب",
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ]),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.sp),
              child: Image.asset(
                imgLogo,
                height: 109.95.h,
                width: 113.95.w,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0.sp),
              child: SizedBox(
                width: 234.w,
                child: const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ),
            ),
            Visibility(
              visible: isDashboard,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5.sp),
                        width: 88.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23.sp),
                            border: Border.all(color: greyVeryDark)),
                        child: const Center(child: Text("9")),
                      ),
                      Text(
                        "خدمات تم إنجازها",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5.sp),
                        width: 88.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23.sp),
                            border: Border.all(color: greyVeryDark)),
                        child: const Center(child: Text("4")),
                      ),
                      Text(
                        "خدمات قيد الإنجاز",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5.sp),
                        width: 88.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23.sp),
                            border: Border.all(color: greyVeryDark)),
                        child: const Center(child: Text("9")),
                      ),
                      Text(
                        "خدمات تم إلغاءها",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
