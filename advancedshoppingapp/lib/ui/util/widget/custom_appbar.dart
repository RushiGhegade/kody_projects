
import 'package:flutter/material.dart';

import '../../home/mobile/helper/search_textfield.dart';
import '../theme/app_color.dart';
import 'custom_icon.dart';
import 'custom_text.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
          child: CustomIcon(iconData: Icons.menu,size: 26,)),
        flexibleSpace: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  AppColor.appBarGradient1,
                  AppColor.appBarGradient2

                  // Color.fromRGBO(215, 218, 242, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

              )
          ),
        ),
        title: CustomText(title: "Hello Rushi",fontSize: 24,fontWeight: FontWeight.w500,),
        actions: [
          CustomIcon(iconData: Icons.card_travel,size: 27,),
          SizedBox(width: 10,),
          CustomIcon(iconData: Icons.notification_important_rounded,size: 27,),
          SizedBox(width: 10,),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child:Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: SearchTextField())
                ],
              ),

              SizedBox(height: 12,),
            ],
          ),
        )
    );
  }
}
