import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';

class CustomDialog extends StatelessWidget {
  final RxList<Map<dynamic,String>> texts;
  final String? title;


  const CustomDialog(
      {Key? key, required this.texts,required this.title,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var selectedFilter = texts[0]["radio"].obs;
    void onChangeFilter(var service) {
      selectedFilter.value = service;
    }
    return SizedBox(
        width: 200.w,
        child: AlertDialog(
          alignment: const Alignment(2.2, -0.5),
          title: Container(
            color: Colors.white,
            width: 218.w,
            height: 35.h,
            child: Text(
              title!.tr,
              style: const TextStyle(color: primaryColor, height: 1),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          content:
          SizedBox(
              height: 200.h,
              width: 200.w,
              child: Column(
                children: [
                  Container(
                    color: primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                    child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          texts[index]["filter"]!.tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.h)
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                          child: Transform.scale(
                                            scale: 1,
                                            child: Obx(()=>
                                                Radio(
                                                  onChanged: (value) {
                                                    onChangeFilter(value);},
                                                  value:texts[index]["radio"]!,
                                                  groupValue: selectedFilter.value,
                                                  fillColor: MaterialStateProperty.all(Colors.white),
                                                  activeColor: Colors.white
                                                ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white.withOpacity(0.7),
                                    thickness: 1.3,
                                  ),
                                ],
                              );
                            },
                     ),
                  ),
                ],
              )
          )
        ),
    );
  }
}
