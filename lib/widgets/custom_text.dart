import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? height,
      width,
      heightText,
      margin,
      marginTop,
      marginBottom,
      marginEnd,
      marginStart;

  final double fontSize;
  final Color textColor;
  final TextAlign? textAlign;
  final bool? underline, bold;
  final String? endPoint;
  final AlignmentDirectional? alignment;
  final TextDirection? textDirection;
  final VoidCallback? onPressed;

  const CustomText(
      {Key? key,
      this.height,
      this.endPoint,
      this.textDirection,
      this.alignment,
      this.bold,
      this.onPressed,
      this.width,
      this.textAlign,
      this.margin,
      this.marginTop,
      this.marginBottom,
      this.marginEnd,
      this.marginStart,
      this.underline,
      required this.text,
      required this.fontSize,
      required this.textColor,
      this.heightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin != null
          ? EdgeInsetsDirectional.all(margin!)
          : EdgeInsetsDirectional.only(
              top: marginTop != null ? marginTop! : 0,
              bottom: marginBottom != null ? marginBottom! : 0,
              end: marginEnd != null ? marginEnd! : 0,
              start: marginStart != null ? marginStart! : 0,
            ),
      child: SizedBox(
        width: width,
        height: height,
        child: Align(
          alignment: alignment ?? AlignmentDirectional.topStart,
          child: GestureDetector(
            onTap: onPressed,
            child: Text(
              text,
              textAlign: textAlign,
              textDirection: textDirection,
              style: TextStyle(
                fontWeight: bold != null ? FontWeight.bold : FontWeight.normal,
                decoration: underline != null
                    ? TextDecoration.underline
                    : TextDecoration.none,
                fontSize: fontSize,
                height: heightText,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
