import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/check_login_status.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';

import '../../../../framework/controller/app_controller/app_controller.dart';
import '../../../../framework/controller/auth_controller/auth_controllers.dart';
import '../../../../framework/utils/local_database_hive.dart';
import '../../../../framework/utils/local_database_sharedpreferance.dart';
import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/custom_Navigation.dart';
import '../../../utils/widgets/custom_sizebox.dart';
import '../../../utils/widgets/custom_snackar.dart';
import '../../../utils/widgets/custom_text_widget.dart';
import '../../helper/action_button.dart';
import '../../helper/enter_text.dart';
import '../../helper/rich_text.dart';

class LoginScreenWeb extends ConsumerStatefulWidget {
  const LoginScreenWeb({super.key});

  @override
  ConsumerState<LoginScreenWeb> createState() => _LoginScreenWebState();
}

class _LoginScreenWebState extends ConsumerState<LoginScreenWeb> {
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
              key: AppController.formKeyLoginWeb,
              child: Column(
                children: [
                  EnterTextField(
                    iconData: Icons.person,
                    isPassword: false,
                    text: "Enter the Email",
                    controller: userNameTextEditingController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Please enter an email address';
                      }

                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(v)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  CustomSizeBox.height20,
                  EnterTextField(
                    iconData: Icons.lock,
                    text: "Enter the Password",
                    isPassword: true,
                    controller: passwordTextEditingController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Please enter the password';
                      } else if (v.length < 6) {
                        return "password length grater then 6";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),

            Spacer(flex: 5),
            ActionButton(
              text: "Login",
              callback: () async {
                if (AppController.formKeyLoginWeb.currentState!.validate()) {
                  String str = await LocalDatabaseHive.isUserPresent(
                    userNameTextEditingController.text,
                    passwordTextEditingController.text,
                  );

                  if (str == "valid") {
                    await LocalDataBaseSharedPref.storeLoginInfo(true,userNameTextEditingController.text);
                    // awLocalDataBaseSharedPref.storeCurrentUserLoginId(userNameTextEditingController.text);
                    print("user id : ${userNameTextEditingController.text}");

                    products = [...copyList];

                    await LocalDatabaseHive.getFirstTimeData(
                      userNameTextEditingController.text,
                    );

                    final get =  ref.invalidate(getUserCredential);


                    ref.read(productListProvider.notifier).addData();
                    ref.read(checkLoginStatus.notifier).state = true;

                    CustomSnackBar.showMySnackBar(
                      context,
                      "Login Successfully",
                      AppColor.successColor,
                    );

                    CustomNavigation.homeScreen(context);
                  } else {
                    ref.read(checkLoginStatus.notifier).state = false;
                    CustomSnackBar.showMySnackBar(
                      context,
                      str,
                      AppColor.errorColor,
                    );
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
                products = [...copyList];
                print("Gest Login");
                ref.read(checkLoginStatus.notifier).state = false;

                ref.read(productListProvider.notifier).addData();
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
