
import 'package:flutter/material.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/ui/cart/checkout_screen.dart';
import 'package:shopping_app/ui/cart/order_confermation.dart';
import 'package:shopping_app/ui/home/mobile/screens/productdetailedscreen.dart';
import 'package:shopping_app/ui/order/order_screen.dart';
import 'package:shopping_app/ui/profile/profile_screen.dart';

import '../../auth/mobile/screens/createaccount_screen_mobile.dart';
import '../../cart/cart_screen.dart';
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


  // Checkout screen Navigation
  static void checkoutScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: CheckoutScreen(), web: CheckoutScreen()).getLayout();
    }));
  }

  // Product Detailed Screen
  static void productDetailScreenNavigation(BuildContext context,bool isCheckStatus,ProductDetails product){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: ProductDetailsScreen(product: product,isCheckStatus: isCheckStatus,), web: ProductDetailsScreen(product: product,isCheckStatus: isCheckStatus)).getLayout();
    }));
  }

  // Confirmation screen
  static void confirmationScreenNavigation(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: OrderConfirmation(), web: OrderConfirmation()).getLayout();
    }));
  }


  // Order Screen Navigation
  static void orderScreenNavigation(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: OrderScreen(), web: OrderScreen()).getLayout();
    }));
  }

  // Product Detailed Screen
  static void cartScreenNavigation(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: AddToCart(), web: AddToCart()).getLayout();
    }));
  }


  // Profile  Screen
  static void profileScreenNavigation(BuildContext context){

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: ProfileScreen(), web: ProfileScreen()).getLayout();
    }));
  }
}