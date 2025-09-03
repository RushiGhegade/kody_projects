
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_Icon.dart';
import 'custom_search.dart';


class CustomAppbar extends ConsumerWidget {


final String title;
  final isShowTextField;
  final bool isWeb;

  const CustomAppbar({

    super.key,
    required this.title,
    required this.isShowTextField,
    required  this.isWeb,
  });



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
        leading:isWeb ?  GestureDetector(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: CustomIcon(iconData: Icons.menu,size: 26,)):null,
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
        title:  CustomTextWidget(text: title,fontSize: 21.spMin,fontWeight: FontWeight.w500,),
        actions: [
          GestureDetector(
              onTap: ()async{
                ref.read(productListProvider.notifier).getAddToCartList();

                CustomNavigation.cartScreenNavigation(context);
              },
              child: CustomIcon(iconData: Icons.card_travel,size: 26.spMin,)),
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

              SizedBox(height: 12.spMin,),
            ],
          ),
        )
    );
  }
}