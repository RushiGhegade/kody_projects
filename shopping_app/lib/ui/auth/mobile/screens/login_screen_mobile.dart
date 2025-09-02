import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';
import 'package:shopping_app/framework/utils/local_database_sharedpreferance.dart';
import 'package:shopping_app/ui/auth/helper/action_button.dart';
import 'package:shopping_app/ui/auth/helper/enter_text.dart';
import 'package:shopping_app/ui/auth/helper/rich_text.dart';
import 'package:shopping_app/ui/auth/mobile/screens/createaccount_screen_mobile.dart';
import 'package:shopping_app/ui/home/mobile/screens/home_screen_mobile.dart';
import 'package:shopping_app/ui/auth/web/screens/createaccount_screen_web.dart';
import 'package:shopping_app/ui/home/web/screens/home_screen_web.dart';
import 'package:shopping_app/ui/helper/check_screen_layout.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../utils/widgets/custom_snackar.dart';

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({super.key});

  @override
  State<LoginScreenMobile> createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {

   TextEditingController userNameTextEditingController = TextEditingController();
   TextEditingController passwordTextEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 10),
            CustomTextWidget(

              text: "Login",
              fontSize: 25.spMin,
              fontWeight: FontWeight.bold,
            ),
            Spacer(flex: 7),

            Form(
            key: AuthControllers.formKey,
              child: Column(
                children: [
                  EnterTextField(iconData: Icons.person, isPassword: false,text: "Enter the Email",controller: userNameTextEditingController,
                    validator: (v){

                    if (v == null || v.isEmpty) {
                      return 'Please enter an email address';
                    }
                  
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(v)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },),
                  CustomSizeBox.height20,
                  EnterTextField(iconData: Icons.lock, text: "Enter the Password",isPassword: true,controller: passwordTextEditingController,validator: (v){
                    if (v == null || v.isEmpty) {
                      return 'Please enter the password';
                    }else if(v.length < 6){
                      return "password length grater then 6";
                    }
                    
                    
                    
                    return null;
                  },),
                ],
              ),
            ),


            Spacer(flex: 5),
            ActionButton(
              text: "Login",

              callback: () async{

                if(AuthControllers.formKey.currentState!.validate()) {
                  String str = await LocalDatabaseHive.isUserPresent(
                      userNameTextEditingController.text,
                      passwordTextEditingController.text);

                  if (str=="valid") {
                    LocalDataBaseSharedPref.storeLoginInfo(true);
                    CustomSnackBar.showMySnackBar(
                        context, "Login Successfully", AppColor.successColor);
                    CustomNavigation.homeScreen(context);
                  } else {
                    CustomSnackBar.showMySnackBar(
                        context, str, AppColor.errorColor);
                  }
                }
              },
            ),

            Spacer(flex: 5),
            RichTextCustom(
              firstName: "Don't have an Account? ",
              secondName: "Sign Up",
              callback: () {
                print("Sign in");
                CustomNavigation.createAccountScreen(context);

              },
            ),
            Spacer(),
            Center(child: CustomTextWidget(text: "OR")),
            Spacer(),
            RichTextCustom(
              firstName: "Continue As  ",
              secondName: "Guest",
              callback: () {
                print("Gest Login");
                CustomNavigation.homeScreen(context);

              },
            ),
            Spacer(flex: 5),
          ],
        ),
      ),
    );

  }
}
