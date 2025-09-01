import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/getassets/getColors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, size: 28, color: GetColors.searchIcon),
        hintText: "Ask Meta AI or Search",
        hintStyle: TextStyle(
          color: GetColors.searchIcon,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
        filled: true,
        fillColor: GetColors.textFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
