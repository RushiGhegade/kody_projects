import 'package:flutter/material.dart';
import 'package:todoapp/ui/utils/theme/app_color.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;

  const CustomTextWidget({
    super.key,
    required this.title,
    this.decoration,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      title,
      maxLines: 3,
      style: TextStyle(
        decoration: decoration,
        decorationColor: AppColor.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
