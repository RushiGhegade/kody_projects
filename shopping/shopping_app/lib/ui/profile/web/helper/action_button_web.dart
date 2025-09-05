import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

class ActionButtonWeb extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Size? size;

  const ActionButtonWeb({
    super.key,
    required this.text,
    this.size,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        backgroundColor: AppColor.secondaryColor,
      ),
      child: CustomTextWidget(
        text: text,
        fontSize: 17.spMin,
        color: AppColor.textColor,
      ),
    );
  }
}
