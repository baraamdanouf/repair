import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_app/utils/const_colors.dart';
import 'package:repair_app/utils/local_storage.dart';

class CustomEditText extends StatelessWidget {
  final TextEditingController? textEditingController;

  final TextAlign? textAlign;

  final TextDirection? textDirection;

  final TextInputAction? textInputAction;

  final FocusNode? focusNode;

  final String? hintText, labelText;

  final TextInputType inputType;

  final bool? obscureText;

  final IconData? icon;

  final Color? cursorColor;

  final List<PhoneInputFormatter>? listFormat;

  final int lines;

  final double? width, height;

  final ValueChanged<String>? onSubmitted, onChanged;

  const CustomEditText(
      {Key? key,
      required this.inputType,
      this.textEditingController,
      this.onChanged,
      this.textAlign,
      this.onSubmitted,
      this.focusNode,
      this.textInputAction,
      this.textDirection,
      this.hintText,
      this.icon,
      this.cursorColor,
      this.listFormat,
      this.labelText,
      this.obscureText,
      this.lines = 1,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Directionality(
        textDirection: LocalStorage.languageSelected == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Align(
          alignment: Alignment.topCenter,
          child: TextFormField(
            maxLines: lines,
            controller: textEditingController,
            textAlignVertical: TextAlignVertical.center,
            obscureText: obscureText ?? false,
            textAlign: TextAlign.start,
            textDirection: textDirection,
            inputFormatters: listFormat,
            cursorColor: cursorColor,
            keyboardType: inputType,
            style: TextStyle(color: Colors.black, fontSize: 15.h),
            // validator: (value) {
            //   if (value!.isEmpty) return "مطلوب";
            //   return null;
            // },
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 1.5.w,
                    style: BorderStyle.solid
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: BorderSide(
                    color: greyDark,
                    width: 1.5.w,
                    style: BorderStyle.solid,
                  ),
                ),
                labelText: labelText,
                labelStyle: TextStyle(
                    color: primaryColor, fontSize:
                lines == 1 ? 18.h : 20.h),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: greyDark,
                  height: 1.h,
                  fontSize: lines == 1 ? 15.h : 20.h),
                suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: 2.w,
                      right: 2.w,
                    ),
                    child: Icon(
                      icon,
                      size: 30.w,
                      color: primaryColor,
                    ))
                // SvgPicture.asset(
                //   icon,
                //  // cacheColorFilter: true,
                //   allowDrawingOutsideViewBox: true,
                //   color: primaryColor,
                //   height: 10.sp,
                // ),
                ),
          ),
        ),
      ),
    );
  }
}
