
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomIcon extends StatelessWidget {

  final IconData iconData;
  final double? size;
  final Color? color;

  const CustomIcon({super.key,required this.iconData,this.color = AppColor.secondaryColor,this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
        iconData,
      size: size,
      color: color,
    );
  }
}
