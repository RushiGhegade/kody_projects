import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_text_widget.dart';

// these function perform the onpress action
class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Color? color;

  const ActionButton({super.key, this.color = AppColor.secondaryColor,required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50.spMin),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        backgroundColor:color,
      ),
      child: CustomTextWidget(
        text: text,
        fontSize: 17.spMin,
        color: AppColor.textColor,
      ),
    );
  }
}
