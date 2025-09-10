import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/controller/auth_controller/check_login_status.dart';
import 'package:shopping_app/framework/controller/auth_controller/picimages.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';
import 'package:shopping_app/framework/repository/auth_repository/repository/store_auth_data_repository.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';
import 'package:shopping_app/framework/utils/local_database_sharedpreferance.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Icon.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_snackar.dart';

import '../../../../framework/controller/app_controller/app_controller.dart';
import '../../../../framework/controller/homecontroller/home_controller.dart';
import '../../../utils/widgets/custom_sizebox.dart';
import '../../../utils/widgets/custom_text_widget.dart';
import '../../helper/action_button.dart';
import '../../helper/enter_text.dart';
import '../../helper/rich_text.dart';

class CreateAccountScreenWeb extends ConsumerStatefulWidget {
  const CreateAccountScreenWeb({super.key});

  @override
  ConsumerState<CreateAccountScreenWeb> createState() =>
      _CreateAccountScreenWebState();
}

class _CreateAccountScreenWebState
    extends ConsumerState<CreateAccountScreenWeb> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  //check textField are Filled
  bool isValid() {
    return userNameTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty;
  }

  bool showPassword = false;
  Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            CustomTextWidget(
              text: "Create Account",
              fontSize: 25.spMin,
              fontWeight: FontWeight.bold,
            ),
            Spacer(flex: 2),
            Center(
              child: Column(
                spacing: 9,
                children: [
                  GestureDetector(
                    onTap: () async {
                      print("Function Call");
                      // file =  await PicImages.pickImage();

                      file = await (await PicImages.pickImage())!.readAsBytes();

                      setState(() {});
                    },
                    child: Container(
                      height: 130.spMin,
                      width: 130.spMin,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.textColor.withOpacity(0.2),
                      ),
                      child: (file != null)
                          ? Image.memory(file!, fit: BoxFit.cover)
                          : CustomIcon(
                              iconData: Icons.person,
                              color: AppColor.textColor,
                            ),
                    ),
                  ),
                  if (file == null)
                    CustomTextWidget(text: "Select Profile Image"),
                ],
              ),
            ),
            Spacer(flex: 2),

            Form(
              key: AppController.formKeyCreateAccountWeb,
              child: Column(
                children: [
                  EnterTextField(
                    iconData: Icons.person,
                    isPassword: false,
                    text: "Enter the UserName",
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
                    isPassword: true,
                    text: "Enter the Password",
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
              text: "Create Account",
              callback: () async {
                if (AppController.formKeyCreateAccountWeb.currentState!
                    .validate()) {
                  if (isValid() && file != null) {

                    print("Account Created");
                    ref.read(checkLoginStatus.notifier).state = true;
                    UserInformation userinfo = UserInformation(
                      userName: userNameTextEditingController.text,
                      password: passwordTextEditingController.text,
                      uint8list: file!,
                    );

                    User user = User(
                      id: userNameTextEditingController.text,
                      userInformation: userinfo,
                      userProductInformation: [],
                    );

                    StoreAuthDataRepository().addData(user, user.id, user.id);

                    await LocalDataBaseSharedPref.storeLoginInfo(true,user.id);
                    LocalDataBaseSharedPref.storeCurrentUserLoginId(user.id);
                    products = [...copyList];
                    await LocalDatabaseHive.getFirstTimeData(
                      userNameTextEditingController.text,
                    );
                    ref.invalidate(getUserCredential);
                    CustomNavigation.homeScreen(context);
                    CustomSnackBar.showMySnackBar(
                      context,
                      "Account Created Sucessfully",
                      AppColor.successColor,
                    );
                  } else {
                    ref.read(checkLoginStatus.notifier).state = false;
                    CustomSnackBar.showMySnackBar(
                      context,
                      "Fill All Data",
                      AppColor.errorColor,
                    );
                  }
                }
              },
            ),

            Spacer(flex: 5),
            RichTextCustom(
              firstName: "You Already have an Account? ",
              secondName: "Sign in",
              callback: () {
                print("Sign in");
                CustomNavigation.loginScreen(context);
              },
            ),
            Spacer(flex: 2),
            // Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
