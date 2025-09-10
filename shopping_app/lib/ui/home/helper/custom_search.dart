
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';

import '../../../framework/controller/app_controller/app_controller.dart';
import '../../utils/widgets/custom_Icon.dart';

// it show search text filed in app bar
class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField({super.key});

  @override
  ConsumerState<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (v){
        ref.read(productListProvider.notifier).searchFilter(v.toString());
      },
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