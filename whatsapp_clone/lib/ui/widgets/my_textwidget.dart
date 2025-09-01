import 'package:flutter/material.dart';

import '../../framework/getassets/getColors.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomTextWidget({
    super.key,
    required this.title,
    required this.fontSize,
    this.color = GetColors.white,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: TextOverflow.ellipsis,
        letterSpacing: 0.2,
      ),
    );
  }
}
