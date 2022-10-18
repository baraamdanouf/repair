import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/const_images.dart';

class CustomLogoContainer extends StatelessWidget {
  final String text;

  const CustomLogoContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 25.sp, color: Colors.white),
          ),
          Image.asset(
            imgLogo,
            height: 205.h,
            width: 212.w,
          ),
        ],
      ),
    );
  }
}
