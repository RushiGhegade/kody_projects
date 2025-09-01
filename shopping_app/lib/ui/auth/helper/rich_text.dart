
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../utils/theme/app_color.dart';

class RichTextCustom extends StatelessWidget {
  final String firstName;
  final String secondName;
  final VoidCallback? callback;

  const RichTextCustom({super.key,required this.firstName,this.callback,required this.secondName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        CustomTextWidget(text: firstName),

        GestureDetector(
            onTap: (){
              callback!();
            },
            child: CustomTextWidget(text:secondName,color: AppColor.primaryColor,)),
      ],
    );
  }
}
