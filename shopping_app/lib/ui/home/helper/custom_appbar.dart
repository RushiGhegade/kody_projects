
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_Icon.dart';
import 'custom_search.dart';


class CustomAppbar extends StatelessWidget {

  final isShowTextField;

  const CustomAppbar({
    super.key,
    required this.isShowTextField,
  });



  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
        // leading: GestureDetector(
        //     onTap: (){
        //       Scaffold.of(context).openDrawer();
        //     },
        //     child: CustomIcon(iconData: Icons.menu,size: 26,)),
        flexibleSpace: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                colors:[

                  AppColor.primaryColor,
                  AppColor.primaryColor.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

              )
          ),
        ),
        title:  CustomTextWidget(text: "DashBoard",fontSize: 21.spMin,fontWeight: FontWeight.w500,),
        actions: [
          CustomIcon(iconData: Icons.card_travel,size: 26.spMin,),
          SizedBox(width: 10.spMin,),
          CustomIcon(iconData: Icons.notification_important_rounded,size: 26.spMin,),
          SizedBox(width: 10.spMin,),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child:Column(
            children: [

              if(isShowTextField)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: SearchTextField()
                    )
                  ],
                ),

              SizedBox(height: 12,),
            ],
          ),
        )
    );
  }
}