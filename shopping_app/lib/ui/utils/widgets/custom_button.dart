
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

/// these is for custom button it give on press to the user
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color? color;
  final Color? textColor;
  final Size? size;
  final double radius;

  const CustomButton({
    super.key,
    this.radius = 10,
    required this.title,
    required this.callback,
    this.color,
    this.size,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      style: ElevatedButton.styleFrom(
        shadowColor: AppColor.secondaryColor,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        fixedSize: size,
      ),
      child: CustomTextWidget(text: title,color: textColor,fontSize: 16.spMin,fontWeight: FontWeight.w500),
    );
  }
}
