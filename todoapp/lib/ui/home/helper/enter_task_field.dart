import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/framework/controller/select_category_controller.dart';
import 'package:todoapp/framework/enums/select_mode.dart';
import 'package:todoapp/ui/utils/widgets/custom_icons_widget.dart';

import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_text_widget.dart';

class EnterTaskField extends ConsumerStatefulWidget {
  String title;
  TextEditingController? controller;
  double? fontSize;
  Color color;
  FontWeight? fontWeight;
  VoidCallback? callback;
  IconData? iconData;
  bool readOnly;
  EnterTaskField({
    super.key,
    required this.title,
    this.readOnly = false,
    this.iconData,
    this.callback,
    required this.color,
    this.fontWeight,
    this.controller,
    this.fontSize,
  });

  @override
  ConsumerState<EnterTaskField> createState() => _EnterTaskFieldState();
}

class _EnterTaskFieldState extends ConsumerState<EnterTaskField> {
  @override
  Widget build(BuildContext context) {
    final getDarkMode = ref.watch(isDark);
    return SizedBox(
      // height: 50,
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        minLines: 1,
        maxLines: 3,
        onChanged: (v) {},
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: (getDarkMode == SelectDarkMode.Dark)
              ? AppColor.white
              : AppColor.black.withOpacity(0.8),
        ),
        decoration: InputDecoration(
          hint: CustomTextWidget(
            title: widget.title,
            fontSize: widget.fontSize,
            color: (getDarkMode == SelectDarkMode.Dark)
                ? AppColor.white
                : widget.color,
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: (widget.iconData != null)
              ? GestureDetector(
                  onTap: () {
                    widget.callback!();
                  },
                  child: CustomIconsWidget(
                    iconData: widget.iconData!,
                    size: 20.spMin,
                    color: (getDarkMode == SelectDarkMode.Dark)
                        ? AppColor.white
                        : AppColor.black.withOpacity(0.7),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
