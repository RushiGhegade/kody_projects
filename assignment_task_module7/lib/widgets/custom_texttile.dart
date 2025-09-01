import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? str;
  final double? size;
  final FontWeight? weight;
  final String? fontFamily;
  final Color? color;
  final TextAlign? textAlign;
  const CustomText({
    super.key,
    required this.str,
    this.size = 10,
    this.weight = FontWeight.normal,
    this.fontFamily,
    this.color = Colors.white,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      str!,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
