
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Icon.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

class EnterTextField extends StatefulWidget {

  final IconData iconData;
  final String text;
  final TextEditingController? controller;

  const EnterTextField({super.key,required this.iconData,required this.text,this.controller});

  @override
  State<EnterTextField> createState() => _EnterTextFieldState();
}

class _EnterTextFieldState extends State<EnterTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hint: CustomTextWidget(text: widget.text),
        prefixIcon: CustomIcon(iconData: widget.iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
