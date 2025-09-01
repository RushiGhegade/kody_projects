import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/ui/auth/helper/action_button.dart';
import 'package:shopping_app/ui/auth/helper/enter_text.dart';
import 'package:shopping_app/ui/auth/helper/rich_text.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({super.key});

  @override
  State<LoginScreenMobile> createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 10,),
            CustomTextWidget(
              text: "Login",
              fontSize: 25.spMin,
              fontWeight: FontWeight.bold,
            ),
            Spacer(flex: 7,),
            EnterTextField(iconData: Icons.person, text: "Enter the UserName"),
            CustomSizeBox.height20,
            EnterTextField(iconData: Icons.lock, text: "Enter the Password"),
            Spacer(flex: 5,),
            ActionButton(text: "Login", callback: (){
              print("Login");
            }),

            Spacer(flex: 5,),
        RichTextCustom(firstName: "Don't have an Account? ", secondName: "Sign Up",callback: (){
          print("Sign in");
        }),
            Spacer(),
            Center(child: CustomTextWidget(text: "OR"),),
            Spacer(),
            RichTextCustom(firstName: "Continue As  ", secondName: "Guest",callback: (){
              print("Gest Login");
            },),
            Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}
