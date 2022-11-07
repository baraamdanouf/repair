import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_app/utils/const_colors.dart';

class CustomButton extends StatelessWidget {
  final double? width, widthBorder;
  final Color? backgroundColor, borderColor, textColor;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.width,
    this.borderColor,
    this.widthBorder,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: 45.h,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
                side: BorderSide(
                  color:
                      borderColor != null ? borderColor! : Colors.transparent,
                  width: widthBorder != null ? widthBorder! : 0,
                ))),
            backgroundColor: backgroundColor != null
                ? MaterialStateProperty.all(backgroundColor)
                : MaterialStateProperty.all(Colors.transparent),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.h,
              fontFamily: lemonda,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              color: textColor ?? Colors.white,
            ),
          ),
        ),
    );
  }
}
