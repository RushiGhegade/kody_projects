

import 'package:advancedshoppingapp/framework/controller/app_controller.dart';
import 'package:advancedshoppingapp/ui/util/theme/app_color.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_icon.dart';
import 'package:flutter/material.dart';

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
        prefixIcon: CustomIcon(iconData: Icons.search,color:AppColor.searchIconColor,),
        suffixIcon: CustomIcon(iconData: Icons.camera_enhance_outlined,color:AppColor.searchIconColor,),
        hintText: "Search",
        hintStyle: TextStyle(
          color: AppColor.searchIconColor
        ),
        fillColor: AppColor.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
        )
      ),
    );
  }
}
