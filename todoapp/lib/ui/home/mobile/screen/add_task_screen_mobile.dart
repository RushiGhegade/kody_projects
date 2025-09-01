import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/framework/controller/task_details_controller.dart';
import 'package:todoapp/framework/controller/time_date_select.dart';
import 'package:todoapp/framework/localdatabase/store_data_locally.dart';
import 'package:todoapp/framework/model/task_model.dart';
import 'package:todoapp/ui/home/helper/elevated_button.dart';
import 'package:todoapp/ui/home/helper/enter_task_field.dart';
import 'package:todoapp/ui/utils/theme/app_color.dart';
import 'package:todoapp/ui/utils/widgets/custom_size_widget.dart';
import 'package:todoapp/ui/utils/widgets/custom_text_widget.dart';

class AddTaskScreenMobile extends ConsumerStatefulWidget {
  final Task? task;
  const AddTaskScreenMobile({super.key, this.task});

  @override
  ConsumerState<AddTaskScreenMobile> createState() =>
      _AddTaskScreenMobileState();
}

class _AddTaskScreenMobileState extends ConsumerState<AddTaskScreenMobile> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.task != null) {
      Task? task = widget.task;
      _titleController.text = task!.title;
      _noteController.text = task.dis;
      _dateController.text = task.date;
      _timeController.text = task.time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      title: "What Do You Need To Do?",
                      fontSize: 23.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomSize.height10,
                    EnterTaskField(
                      title: "Title",
                      controller: _titleController,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black.withOpacity(0.6),
                      fontSize: 25.spMin,
                    ),
                    EnterTaskField(
                      title: "Note",
                      controller: _noteController,
                      color: AppColor.black.withOpacity(0.4),
                      fontSize: 19.spMin,
                    ),

                    EnterTaskField(
                      title: "select Time",
                      controller: _timeController,
                      readOnly: true,
                      color: AppColor.black.withOpacity(0.7),
                      fontSize: 19.spMin,
                      iconData: Icons.timer,
                      callback: () async {
                        print("Select Time");
                        String? time = await TimeDateSelect(
                          context: context,
                        ).selectTime();
                        if (time.isNotEmpty) {
                          _timeController.text = time;
                        }
                      },
                    ),

                    EnterTaskField(
                      title: "select Date",
                      controller: _dateController,
                      readOnly: true,
                      color: AppColor.black.withOpacity(0.7),
                      fontSize: 19,
                      iconData: Icons.date_range,
                      callback: () async {
                        print("Select Date");
                        String? date = await TimeDateSelect(
                          context: context,
                        ).selectDate();
                        if (date.isNotEmpty) {
                          _dateController.text = date;
                        }
                        print(_dateController.text);
                      },
                    ),
                    // Spacer(),
                  ],
                ),

                Positioned(
                  bottom: 70.h,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomElevatedButton(
                          title: "Cancel Task",
                          callback: () {
                            Navigator.pop(context);
                          },
                        ),
                        CustomElevatedButton(
                          title: (widget.task != null)
                              ? "Update Task"
                              : "Create Task",
                          callback: () {
                            if (isFilledAll()) {
                              if (widget.task == null) {
                                Task task = Task(
                                  id: DateTime.now().millisecond.toString(),
                                  title: _titleController.text,
                                  time: _timeController.text,
                                  dis: _noteController.text,
                                  date: _dateController.text,
                                );
                                print("Add task");
                                ref.read(getTaskDetails.notifier).addTask(task);
                                StoreDataLocally.addTask(task, "task");
                              } else {
                                print("Update task ${widget.task!.id}");

                                Task task = Task(
                                  id: widget.task!.id,
                                  title: _titleController.text,
                                  time: _timeController.text,
                                  dis: _noteController.text,
                                  date: _dateController.text,
                                );
                                ref
                                    .read(getTaskDetails.notifier)
                                    .updateTask(task);
                                StoreDataLocally.updateTask(task, "task");
                              }
                              ref
                                  .read(getTaskDetails.notifier)
                                  .fetchFilteredList();

                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: CustomTextWidget(
                                    title: "All Field Are Required To Field",
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isFilledAll() {
    return _titleController.text.isNotEmpty &&
        _noteController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _titleController.text.isNotEmpty;
  }
}
