import 'package:e_commerce_app/auth/productInfo.dart';
import 'package:e_commerce_app/view/cart_screen.dart';
import 'package:e_commerce_app/view/home_screen.dart';
import 'package:e_commerce_app/view/login_screen.dart';
import 'package:e_commerce_app/view/order_confirmation_screen.dart';
import 'package:e_commerce_app/view/product_detail_screen.dart';
import 'package:e_commerce_app/view/product_list_screen.dart';
import 'package:e_commerce_app/view/setting.dart';
import 'package:e_commerce_app/view/splash_screen.dart';
import 'package:flutter/material.dart';

import 'view/checkout_screen.dart' show CheckoutScreen;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        'login': (context) => LoginScreen(),
        'homescreen': (context) => HomeScreen(),
        'ProductListScreen': (context) => ProductListScreen(),
        'ProductDetailScreen': (context) => ProductDetailScreen(),
        // 'cartScreen': (context) => CartScreen(),
        // "checkoutscreen": (context) => CheckoutScreen(),
        "buy": (context) => OrderConfirmationScreen(),
        'setting': (context) => SettingScreen(),
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        List<ProductInfo> product = settings.arguments as List<ProductInfo>;
        if (settings.name == 'cartScreen') {
          return MaterialPageRoute(
            builder: (context) => CartScreen(cart: product),
          );
        } else if (settings.name == 'checkoutscreen') {
          List<ProductInfo> product = settings.arguments as List<ProductInfo>;
          return MaterialPageRoute(
            builder: (context) => CheckoutScreen(checkoutlist: product),
          );
        }
      },
      // home: SplashScreen(),
    );
  }
}
