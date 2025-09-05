import 'package:flutter/material.dart';

import '../theme/app_color.dart';

/// custom icon show ion screen
class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final double? size;
  final Color? color;

  const CustomIcon({
    super.key,
    required this.iconData,
    this.color = AppColor.secondaryColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(iconData, size: size, color: color);
  }
}
