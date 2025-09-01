import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/framework/controller/select_category_controller.dart';
import 'package:todoapp/framework/controller/task_details_controller.dart';
import 'package:todoapp/framework/enums/select_mode.dart';
import 'package:todoapp/ui/utils/widgets/custom_icons_widget.dart';

import '../../../framework/enums/categories.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_text_widget.dart';

class ShowListviewCategory extends ConsumerStatefulWidget {
  const ShowListviewCategory({super.key});

  @override
  ConsumerState<ShowListviewCategory> createState() =>
      _ShowListviewCategoryState();
}

class _ShowListviewCategoryState extends ConsumerState<ShowListviewCategory> {
  List<String> list = ["Sort By", "Date", "Completion", "Clear"];
  @override
  Widget build(BuildContext context) {
    final selectedCategory = ref.watch(selectCategory);
    final isdarkMode = ref.watch(isDark);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Categories.values.length,
          itemBuilder: (context, index) {
            String category = Categories.values[index].name;
            return GestureDetector(
              onTap: () {
                ref.read(selectCategory.notifier).state =
                    Categories.values[index];
                ref
                    .read(getTaskDetails.notifier)
                    .addFilter(Categories.values[index]);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 8.r),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  color: selectedCategory.name == category
                      ? AppColor.blue.withOpacity(0.4)
                      : null,
                  borderRadius: BorderRadius.circular(19.r),
                  border: Border.all(
                    color: (isdarkMode == SelectDarkMode.Light)
                        ? AppColor.black.withOpacity(0.6)
                        : AppColor.white,
                  ),
                ),
                child: CustomTextWidget(title: category, fontSize: 14.spMin),
              ),
            );
          },
        ),

        // Spacer(),
        SizedBox(
          height: 30.spMin,
          width: 20.spMin,
          child: FittedBox(
            fit: BoxFit.cover,
            child: PopupMenuButton(
              color: AppColor.blue,
              icon: CustomIconsWidget(iconData: Icons.more_vert,size: 25.spMin, ),
              onSelected: (value) {
                ref
                    .read(getTaskDetails.notifier)
                    .addFilter(selectedCategory, sortBy: value);
              },
              itemBuilder: (context) {
                return list.map((ele) {
                  return PopupMenuItem<String>(
                    value: ele,
                    child: CustomTextWidget(title: ele, color: AppColor.white),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ],
    );
  }
}
