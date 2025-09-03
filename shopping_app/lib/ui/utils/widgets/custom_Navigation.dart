
import 'package:flutter/material.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/ui/cart/checkout_screen.dart';
import 'package:shopping_app/ui/cart/order_confermation.dart';
import 'package:shopping_app/ui/home/mobile/screens/productdetailedscreen.dart';

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
  static void productDetailScreenNavigation(BuildContext context,ProductDetails product){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: ProductDetailsScreen(product: product), web: ProductDetailsScreen(product: product)).getLayout();
    }));
  }

  // Confirmation screen
  static void confirmationScreenNavigation(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: OrderConfermation(), web: OrderConfermation()).getLayout();
    }));
  }


  // Product Detailed Screen
  static void cartScreenNavigation(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CheckScreenLayout(mobile: AddToCart(), web: AddToCart()).getLayout();
    }));
  }
}