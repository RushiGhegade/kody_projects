import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/framework/controller/date_time_controller.dart';
import 'package:todoapp/framework/controller/select_category_controller.dart';
import 'package:todoapp/framework/enums/select_mode.dart';

import '../../utils/widgets/custom_icons_widget.dart';
import '../../utils/widgets/custom_text_widget.dart';

class ShowAppbar extends ConsumerWidget {
  const ShowAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getRef = ref.watch(getDateTime);
    final getdarkMode = ref.watch(isDark);
    return ListTile(
      contentPadding: EdgeInsets.all(5.r),
      title: CustomTextWidget(
        title: "Today task",
        fontWeight: FontWeight.bold,
        fontSize: 29.spMin,
      ),
      subtitle: CustomTextWidget(
        title: "${getRef[0]}  ${getRef[1]}",
        fontSize: 17.spMin,
      ),
      trailing: GestureDetector(
        onTap: () {
          if (getdarkMode == SelectDarkMode.Light) {
            ref.read(isDark.notifier).state = SelectDarkMode.Dark;
          } else {
            ref.read(isDark.notifier).state = SelectDarkMode.Light;
          }
        },
        child: CustomIconsWidget(
          iconData: getdarkMode == SelectDarkMode.Light
              ? Icons.dark_mode_outlined
              : Icons.dark_mode,
          size: 30.spMin,
        ),
      ),
    );
  }
}
