import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_text_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? callback;
  const CustomElevatedButton({super.key, required this.title, this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback!();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.blue,
        fixedSize: Size(MediaQuery.sizeOf(context).width * 0.43, 50.spMin),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: CustomTextWidget(title: title, color: AppColor.white),
    );
  }
}
