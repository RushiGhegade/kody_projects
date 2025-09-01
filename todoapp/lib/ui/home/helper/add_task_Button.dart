import 'package:flutter/material.dart';
import 'package:todoapp/ui/home/helper/check_screen_layout.dart';
import 'package:todoapp/ui/home/mobile/screen/add_task_screen_mobile.dart';

import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_icons_widget.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CheckScreenLayout(
                mobile: AddTaskScreenMobile(),
                web: AddTaskScreenMobile(),
                tablet: AddTaskScreenMobile(),
              ).getLayout();
            },
          ),
        );
      },
      child: CustomIconsWidget(iconData: Icons.add, color: AppColor.white),
    );
  }
}
