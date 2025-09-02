
import 'package:flutter/material.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/ui/home/mobile/screens/productdetailedscreen.dart';

import '../../auth/mobile/screens/createaccount_screen_mobile.dart';
import '../../home/mobile/screens/home_screen_mobile.dart';
import '../../auth/mobile/screens/login_screen_mobile.dart';
import '../../auth/web/screens/createaccount_screen_web.dart';
import '../../home/web/screens/home_screen_web.dart';
import '../../auth/web/screens/login_screen_web.dart';
import '../../helper/check_screen_layout.dart';

class CustomNavigation{

  // HomeScreen Navigation
  static void homeScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: HomeScreenMobile(), web: HomeScreenWeb()).getLayout();
    }));
  }

  // login Screen Navigation
  static void loginScreen(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: LoginScreenMobile(), web: LoginScreenWeb()).getLayout();
    }));

  }

  // HomeScreen Navigation
  static void createAccountScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: CreateaccountScreenMobile(), web: CreateAccountScreenWeb()).getLayout();
    }));
  }


  // Product Detailed Screen
  static void productDetailScreenNavigation(BuildContext context,ProductDetails product){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: ProductDetailsScreen(product: product), web: CreateAccountScreenWeb()).getLayout();
    }));
  }
}