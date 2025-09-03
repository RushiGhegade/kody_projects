import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int maxLines;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;

  const CustomTextWidget({super.key,this.textAlign,this.textDecoration,this.maxLines=1,required this.text,this.color,this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: textDecoration,
        color: color,
        fontSize:fontSize ,
        fontWeight: fontWeight,
      ),
    );
  }

}
