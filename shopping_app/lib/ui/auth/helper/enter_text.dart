
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Icon.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

class EnterTextField extends StatefulWidget {

  final IconData iconData;
  final String text;
  final TextEditingController? controller;
   bool isPassword;
  final String? Function(String?)? validator;


   EnterTextField({super.key,required this.isPassword,required this.iconData,this.validator,required this.text,this.controller});

  @override
  State<EnterTextField> createState() => _EnterTextFieldState();
}

class _EnterTextFieldState extends State<EnterTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        hint: CustomTextWidget(text: widget.text),
        suffixIcon:widget.text=="Enter the Password" ?  GestureDetector(
            onTap: (){
              widget.isPassword = !widget.isPassword;
              setState(() {
              });
            },
            child: CustomIcon(iconData: (widget.isPassword)? Icons.visibility:Icons.visibility_off)):null,
        prefixIcon: CustomIcon(iconData: widget.iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
