import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todoapp/framework/controller/select_category_controller.dart';
import 'package:todoapp/framework/controller/task_details_controller.dart';
import 'package:todoapp/framework/enums/select_mode.dart';
import 'package:todoapp/framework/model/task_details.dart';
import 'package:todoapp/framework/model/task_model.dart';
import 'package:todoapp/ui/home/helper/cart_display.dart';
import 'package:todoapp/ui/utils/theme/app_images.dart';
import 'package:todoapp/ui/utils/widgets/custom_text_widget.dart';

class ShowMyTask extends ConsumerStatefulWidget {
  final int crossAxisCount;
  const ShowMyTask({super.key, required this.crossAxisCount});

  @override
  ConsumerState<ShowMyTask> createState() => _ShowMyTaskState();
}

class _ShowMyTaskState extends ConsumerState<ShowMyTask> {
  @override
  Widget build(BuildContext context) {
    TaskDetails taskDetails = ref.watch(getTaskDetails);
    final mode = ref.watch(isDark);

    return (taskDetails.filteredTask.isEmpty)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  height: 100.h,
                  width: 100.h,
                  fit: BoxFit.cover,
                  mode.name == SelectDarkMode.Dark.name
                      ? AppImages.blackBackground
                      : AppImages.whiteBackground,
                ),
                CustomTextWidget(title: "No Tasks"),
              ],
            ),
          )
        : MasonryGridView.count(
            crossAxisCount: widget.crossAxisCount,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 7.w,
            itemCount: taskDetails.filteredTask.length,
            itemBuilder: (context, index) {
              Task task = taskDetails.filteredTask[index];
              return CartDisplay(task: task, index: index);
            },
          );
  }
}
