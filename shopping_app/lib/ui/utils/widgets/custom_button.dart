
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

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
      child: CustomTextWidget(text: title,color: textColor,),
    );
  }
}
