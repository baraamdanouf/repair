import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/ui/profile/profile_controller.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DoubleBack(
      message: "Press again BACK to exit".tr,
      background: primaryColor,
      textStyle: const TextStyle(color: Colors.white),
      child: Scaffold(
        key: controller.profileKey,
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: width,
            height: height,
            child: Center(
                child: Text("Profile",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold))),
          ),
        ),
      ),
    );
  }
}
