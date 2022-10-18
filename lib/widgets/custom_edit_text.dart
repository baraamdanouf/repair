import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_app/utils/const_colors.dart';

class CustomEditText extends StatelessWidget {

  final TextEditingController? controller;

  final TextAlign? textAlign;

  final TextDirection? textDirection;

  final TextInputAction? textInputAction;

  final FocusNode? focusNode;

  final String?  hintText;

  final TextInputType inputType;

  final bool? autoCorrect, autoFocus, filled;

  final IconData? icon;

  final Color? cursorColor;

 final List<TextInputFormatter>? listFormat;

  final ValueChanged<String>? onSubmitted, onChanged;

  const CustomEditText(
      {Key? key,
        required this.inputType,
        this.controller,
        this.onChanged,
        this.textAlign,
        this.onSubmitted,
        this.focusNode,
        this.textInputAction,
        this.textDirection,
        this.hintText,
        this.autoCorrect,
        this.autoFocus,
        this.filled, this.icon, this.cursorColor, this.listFormat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: 300.w,
        height: 50.h,
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.end,
          textInputAction: textInputAction,
          textDirection: TextDirection.ltr,
    //      inputFormatters: [PhoneInputFormatter()],
          focusNode: focusNode,
          cursorColor: cursorColor,
          keyboardType: inputType,
          autofocus: autoFocus ?? false,
       //   onSubmitted: onSubmitted,
          onChanged: onChanged,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
          ),

          decoration: InputDecoration(
            filled: filled ?? true,
            contentPadding: EdgeInsetsDirectional.all(5.sp),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.sp),
              borderSide: BorderSide(
                color: greyBorder,
                width: 2.w,
                style:BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.sp),
              borderSide: BorderSide(
                color: greyBorder,
                width: 2.w,
                style:BorderStyle.solid,
              ),
            ),
            hintText: hintText,
            hintStyle:TextStyle(
              height: 0.0,
              color: greyDark,
              fontSize: 13.sp,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: 5.sp,
                right: 5.sp,
              ),
              child: Icon(
                icon,
                color: primaryColor,
                size: 35.sp,
              ),
            ),

          ),));
  }
}
