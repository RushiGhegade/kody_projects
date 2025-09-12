
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_color.dart';

class CustomTextField extends ConsumerStatefulWidget {

  final String text;
  final TextEditingController? controller;
  final Function(String)? callback;
  final IconData iconData;

  const CustomTextField({super.key,required this.iconData,required this.text,this.callback,this.controller});

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onFieldSubmitted:widget.callback,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
          prefixIcon: Icon(widget.iconData),
          hintText:widget.text,
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
