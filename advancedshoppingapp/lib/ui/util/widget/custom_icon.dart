
import 'package:advancedshoppingapp/ui/util/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {

  final IconData? iconData;
  final Color? color;
  final double size;

  const CustomIcon({super.key,required this.iconData,this.size=25,this.color=AppColor.white});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
      size: size,
    );
  }
}
