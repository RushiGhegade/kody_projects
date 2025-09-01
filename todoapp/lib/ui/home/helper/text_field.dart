
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../framework/controller/task_details_controller.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_icons_widget.dart';
class TextFieldSearch extends ConsumerWidget {
  const TextFieldSearch({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      onChanged: (v){
        ref.read(getTaskDetails.notifier).searchTask(v.toString());
      },
      decoration: InputDecoration(
          prefixIcon: CustomIconsWidget(iconData: Icons.search,color: AppColor.white),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.r),
              borderSide: BorderSide(color:Colors.black,width: 0.1)
          ),
          fillColor: AppColor.blue,
          hintText: "Search Task...",
          hintStyle: TextStyle(
              color: AppColor.white
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.r),
              borderSide: BorderSide.none
          )
      ),
    );
  }
}
