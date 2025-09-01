import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/framework/controller/app_controller.dart';
import 'package:todoapp/framework/controller/select_category_controller.dart';
import 'package:todoapp/framework/controller/task_details_controller.dart';
import 'package:todoapp/framework/model/task_model.dart';
import 'package:todoapp/ui/home/helper/check_screen_layout.dart';
import 'package:todoapp/ui/home/mobile/screen/add_task_screen_mobile.dart';
import 'package:todoapp/ui/utils/theme/app_color.dart';
import 'package:todoapp/ui/utils/widgets/custom_text_widget.dart';

class CartDisplay extends ConsumerWidget {
  final Task task;
  final int index;
  const CartDisplay({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getcategory = ref.watch(selectCategory);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CheckScreenLayout(
                        mobile: AddTaskScreenMobile(task: task),
                        web:AddTaskScreenMobile(task: task),
                        tablet:AddTaskScreenMobile(task: task),
                      ).getLayout();
                    },
                  ),
                );
              },
              icon: Icons.edit,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            SlidableAction(
              onPressed: (BuildContext context) {
                print("Method call");
                ref.read(getTaskDetails.notifier).deleteTask(task.id);
                ref.read(getTaskDetails.notifier).fetchFilteredList();
              },
              icon: Icons.delete,
              backgroundColor: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.r),
                bottomRight: Radius.circular(5.r),
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.spMin,
            vertical: 10.spMin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color:
                AppController.colorList[index % AppController.colorList.length],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          title: task.title,
                          decoration: (!task.isCompleted)
                              ? null
                              : TextDecoration.lineThrough,
                          color: AppColor.black.withOpacity(0.8),
                          fontSize: 18.spMin,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomTextWidget(
                          title: task.dis,
                          decoration: (!task.isCompleted)
                              ? null
                              : TextDecoration.lineThrough,
                          color: AppColor.black.withOpacity(0.7),
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.spMin,
                    width: 40.spMin,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Checkbox(
                        activeColor: Colors.green,

                        shape: CircleBorder(),
                        value: task.isCompleted,
                        onChanged: (v) {
                          Task task1 = task.copyWith(isCompleted: v!);

                          ref.read(getTaskDetails.notifier).updateTask(task1);
                          ref
                              .read(getTaskDetails.notifier)
                              .addFilter(getcategory);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextWidget(
                    fontSize: 15.spMin,
                    color: AppColor.black.withOpacity(0.8),
                    title: "${task.date} At ${task.time}",
                    decoration: (!task.isCompleted)
                        ? null
                        : TextDecoration.lineThrough,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
