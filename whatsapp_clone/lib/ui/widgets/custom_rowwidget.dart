
import 'package:flutter/material.dart';

import '../../framework/getassets/getColors.dart';
import '../../framework/getassets/images.dart';
import 'my_textwidget.dart';

class CustomRowWidget extends StatelessWidget {

  final String title;
  final String image;
  final Color boxColor;
  final Color imageColor;
  final bool flag;
  final bool? isPadding;


  const CustomRowWidget({super.key,this.isPadding,required this.flag,required this.title,this.image=GetImages.community,required this.boxColor,required this.imageColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if(!flag)
          SizedBox(width: 3,),
        Container(
          height: 50,
          width: 50,
          padding:(isPadding==null)?EdgeInsets.all(12):EdgeInsets.all(1),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(15),
            color: boxColor, //GetColors.searchIcon.withAlpha(100),
            // image: DecorationImage(image: AssetImage(GetImages.community),scale: 0.5,fit: BoxFit.cover)
          ),
          child:Image.asset(image,height: 15,width: 15,color: imageColor,) ,
        ),

        CustomTextWidget(title: title, fontSize: 18,color: GetColors.black,fontWeight: FontWeight.w500,),
      ],
    );
  }
}
