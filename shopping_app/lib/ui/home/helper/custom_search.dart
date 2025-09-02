
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';

import '../../../framework/controller/app_controller/app_controller.dart';
import '../../utils/widgets/custom_Icon.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: AppController.searchController,
      decoration: InputDecoration(
          prefixIcon: CustomIcon(iconData: Icons.search,size: 24.spMin,),
          suffixIcon: CustomIcon(iconData: Icons.camera_enhance_outlined,size: 24.spMin),
          hintText: "Search",
          hintStyle: TextStyle(
              color: AppColor.textColor
          ),
          fillColor: AppColor.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none
          )
      ),
    );
  }
}