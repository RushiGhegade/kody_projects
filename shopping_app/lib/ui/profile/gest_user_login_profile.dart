
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Icon.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../framework/controller/homecontroller/select_category.dart';
import '../auth/helper/action_button.dart';
import '../home/helper/custom_appbar.dart';
import '../home/mobile/helper/navigation_bar.dart';

class GestUserLoginProfile extends ConsumerStatefulWidget {
  const GestUserLoginProfile({super.key});

  @override
  ConsumerState<GestUserLoginProfile> createState() => _GestUserLoginProfileState();
}

class _GestUserLoginProfileState extends ConsumerState<GestUserLoginProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.spMin),
        child: CustomAppbar(
          title: "Profile Screen",
          isWeb: false,
          isShowTextField: false,
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 10.h,
            children: [
            Spacer(),
              Center(
                child: Container(
                  height: 150.spMin,
                  width: 150.spMin,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.textColor.withOpacity(0.3),
                  ),
                  alignment: Alignment.center,
                  child: CustomIcon(iconData: Icons.person,size: 50.spMin.spMin),
                ),
              ),
              CustomSizeBox.height5,
              CustomTextWidget(text: "You Must have An Account",fontSize: 21.spMin,fontWeight: FontWeight.w600,)
              ,CustomTextWidget(text: "Become a Member and Enjoy the Online shopping",maxLines: 2,fontSize: 14.spMin,fontWeight: FontWeight.w500,)
,Spacer(flex: 3,),
              ActionButton(text: "Register", callback: (){
                ref.read(selectedIndexProvider.notifier).state = 0;
                CustomNavigation.createAccountScreen(context);
              }),
              ActionButton(text: "Log in", callback: (){
                ref.read(selectedIndexProvider.notifier).state = 0;
                CustomNavigation.loginScreen(context);
              }),

              CustomSizeBox.height5,

            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar()
    );
  }
}
