
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {

  final IconData? icon;
  final double? fontSize;
  final Color color;
  const CustomIcon({super.key,required this.icon,this.fontSize=15,this.color=Colors.black});

  @override
  Widget build(BuildContext context){
    return Icon(
      icon,
      size: fontSize,
      color: color,
    );
  }
}
