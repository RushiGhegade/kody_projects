import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/framework/controller/select_category_controller.dart';
import 'package:todoapp/framework/controller/task_details_controller.dart';
import 'package:todoapp/framework/enums/select_mode.dart';
import 'package:todoapp/framework/model/task_details.dart';
import 'package:todoapp/ui/home/helper/add_task_Button.dart';
import 'package:todoapp/ui/home/helper/cart_display.dart';
import 'package:todoapp/ui/home/helper/show_appbar.dart';
import 'package:todoapp/ui/home/helper/show_listview_category.dart';
import 'package:todoapp/ui/home/helper/show_slider_completed.dart';
import 'package:todoapp/ui/home/helper/text_field.dart';
import 'package:todoapp/ui/utils/theme/app_images.dart';
import 'package:todoapp/ui/utils/widgets/custom_size_widget.dart';
import 'package:todoapp/ui/utils/widgets/custom_text_widget.dart';

import '../../../../framework/model/task_model.dart';

class HomeScreenMobile extends ConsumerStatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  ConsumerState<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends ConsumerState<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    final getcategory = ref.watch(selectCategory);
    final mode = ref.watch(isDark);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            spacing: 8.h,
            children: [
              ShowAppbar(),

              ShowSliderCompleted(),
              SizedBox(height: 50, child: TextFieldSearch()),
              CustomSize.height2,
              SizedBox(
                height: 32.h,
                width: MediaQuery.sizeOf(context).width,
                child: ShowListviewCategory(),
              ),
              // ShowSliderCompleted(),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    TaskDetails taskDetails = ref.watch(getTaskDetails);
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
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: taskDetails.filteredTask.length,
                            itemBuilder: (context, index) {
                              Task task = taskDetails.filteredTask[index];
                              return CartDisplay(task: task, index: index);
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddTaskButton(),
    );
  }
}
