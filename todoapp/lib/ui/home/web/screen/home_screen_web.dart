import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/ui/home/helper/add_task_Button.dart';
import 'package:todoapp/ui/home/helper/show_appbar.dart';
import 'package:todoapp/ui/home/helper/show_listview_category.dart';
import 'package:todoapp/ui/home/helper/show_my_task.dart';
import 'package:todoapp/ui/home/helper/show_slider_completed.dart';
import 'package:todoapp/ui/home/helper/text_field.dart';
import 'package:todoapp/ui/utils/widgets/custom_size_widget.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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

            Expanded(child: ShowMyTask(crossAxisCount: 3)),
          ],
        ),
      ),
      floatingActionButton: AddTaskButton(),
    );
  }
}
