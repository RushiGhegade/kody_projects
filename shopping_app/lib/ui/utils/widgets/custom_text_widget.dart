import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomTextWidget({super.key,required this.text,this.color,this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        color: color,
        fontSize:fontSize ,
        fontWeight: fontWeight,
      ),
    );
  }

}
