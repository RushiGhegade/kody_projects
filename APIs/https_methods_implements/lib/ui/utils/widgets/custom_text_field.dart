
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:https_methods_implements/framework/controller/homecontroller/home_controller.dart';
import 'package:https_methods_implements/framework/controller/homecontroller/home_controller_provider.dart';
import 'package:https_methods_implements/ui/utils/theme/app_color.dart';

class CustomTextField extends ConsumerStatefulWidget {
  const CustomTextField({super.key});

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: HomeController.searchController,
      onFieldSubmitted: (v){
          if(v.isEmpty){
            ref.read(apisOperationProvider.notifier).getAllResponseApi();
          }else{
            ref.read(apisOperationProvider.notifier).getUserById(int.parse(v));
          }

      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search Product By Id",
          border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.black),
          borderRadius: BorderRadius.circular(15),
        ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.black),
            borderRadius: BorderRadius.circular(15),
          )
      ),

    );
  }
}
