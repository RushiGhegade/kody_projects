
import 'package:advancedshoppingapp/ui/util/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;


  const CustomText({super.key,this.maxLines,this.textDecoration,this.textOverflow,required this.title,this.fontSize=17,this.fontWeight= FontWeight.w400,this.color=AppColor.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: textOverflow,

      style: TextStyle(
        decoration: textDecoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,

      ),
    );
  }
}
