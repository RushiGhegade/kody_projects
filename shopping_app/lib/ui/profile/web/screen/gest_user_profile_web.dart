import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/homecontroller/select_category.dart';
import 'package:shopping_app/ui/home/helper/custom_appbar.dart';
import 'package:shopping_app/ui/home/web/helper/showdrawer.dart';
import 'package:shopping_app/ui/profile/web/helper/action_button_web.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Icon.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

/// these show the gest web page
class GestUserProfileWeb extends ConsumerStatefulWidget {
  const GestUserProfileWeb({super.key});

  @override
  ConsumerState<GestUserProfileWeb> createState() => _GestUserProfileWebState();
}

class _GestUserProfileWebState extends ConsumerState<GestUserProfileWeb> {
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
        padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
        child: Row(
          children: [
            MyDrawer(),
            Spacer(),
            Center(
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
                      child: CustomIcon(
                        iconData: Icons.person,
                        size: 50.spMin.spMin,
                      ),
                    ),
                  ),
                  CustomSizeBox.height5,
                  CustomTextWidget(
                    text: "You Must have An Account",
                    fontSize: 21.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomTextWidget(
                    text: "Become a Member and Enjoy the Online shopping",
                    maxLines: 2,
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(flex: 3),
                  ActionButtonWeb(
                    text: "Register",
                    size: Size(MediaQuery.sizeOf(context).width * 0.6, 50.h),
                    callback: () {
                      ref.read(selectedIndexProvider.notifier).state = 0;
                      CustomNavigation.createAccountScreen(context);
                    },
                  ),
                  ActionButtonWeb(
                    text: "Log in",
                    size: Size(MediaQuery.sizeOf(context).width * 0.6, 50.h),
                    callback: () {
                      ref.read(selectedIndexProvider.notifier).state = 0;
                      CustomNavigation.loginScreen(context);
                    },
                  ),

                  CustomSizeBox.height5,
                ],
              ),
            ),

            Spacer(),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
