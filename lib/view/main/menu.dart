import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';
import 'package:repair_app/view/reports/report_controller.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReportController());
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(414, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        backgroundColor: secondaryColor,
        body: Container(
          height: height,
          child: Align(
            alignment: Alignment.topRight,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Drawer(
                backgroundColor: Colors.white,
                elevation: 0,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 210.h,
                      child: DrawerHeader(
                          child: Column(
                        children: [
                         SvgPicture.asset(imgLogoBlue, height: 130.h,),
                          Text(
                            "اسم العميل",
                            style: TextStyle(
                              color: primaryColor,
                              height: 2.h,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      )),
                    ),
                    ListTile(
                        dense: true,
                        title: Text(
                          "اختيار اللغة",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 15.sp),
                        ),
                        onTap: () {},
                        leading: SvgPicture.asset(global)),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    ListTile(
                        dense: true,
                        title: Text(
                          "تغيير كلمة المرور",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 15.sp),
                        ),
                        onTap: () {},
                        leading: SvgPicture.asset(password)),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    ListTile(
                        dense: true,
                        title: Text(
                          "عن التطبيق",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 15.sp),
                        ),
                        onTap: () {},
                        leading: SvgPicture.asset(aboutApp)),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    ListTile(
                        dense: true,
                        title: Text(
                          "قييم التطبيق",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 15.sp),
                        ),
                        onTap: () {},
                        leading: SvgPicture.asset(rate)),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    ListTile(
                        dense: true,
                        title: Text(
                          "سياسة الخصوصية",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 15.sp),
                        ),
                        onTap: () {},
                        leading: SvgPicture.asset(insurance)),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    ListTile(
                        dense: true,
                        title: Text(
                          "العقود",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 15.sp),
                        ),
                        onTap: () {},
                        leading: SvgPicture.asset(checkList)),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    ListTile(
                        dense: true,
                        title: Text(
                          "الدفوعات",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 15.sp),
                        ),
                        onTap: () {},
                        leading: SvgPicture.asset(payment)),
                    const Divider(
                      color: greyDark,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تم تنفيذ التطبيق بواسطة: ",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 12.sp,
                              height: 3.h,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Why Not Tech",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 12.sp,
                              height: 2.h,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget serviceItem({Color? color, String? title, String? description}) {
  return Column(
    children: [
      Container(
          width: 366.w,
          height: 112.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          //   color: color,
          margin: EdgeInsets.all(15.sp),
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                    fontSize: 41.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                description ?? "",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    ],
  );
}
