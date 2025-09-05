

import 'package:flutter/material.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';


// show the snack bar to user
class CustomSnackBar{

  static void showMySnackBar(BuildContext context,String text,Color? color){

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
          content: CustomTextWidget(text: text),
          backgroundColor: color,
      )
    );


  }

}