import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool? bold;
  final String? endPoint;
  final Color? color;
  final AlignmentDirectional? alignment;
  final TextDirection? textDirection;


  const CustomText(
      {Key? key,
      this.endPoint,
      this.textDirection,
      this.alignment,
      this.bold,
      required this.text,
      required this.fontSize,
        this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: textDirection,
      style: TextStyle(
        fontWeight: bold != null ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
        color: color
      ),
    );
  }
}
