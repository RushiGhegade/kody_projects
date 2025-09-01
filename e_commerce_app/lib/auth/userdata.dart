import 'package:e_commerce_app/auth/userauth.dart';

import 'productInfo.dart';

class Userdata {
  static List<ProductInfo> products = [
    ProductInfo(
      name: "Oppo Reno 3 Pro",
      desc: "Android phone RAM:6gb  ROM:156gb version:Android 12",
      image: "assets/moile.png",
      price: 25000,
      color: "Red | Blue | back",
      iscart: false,
      quantity: 1,
    ),
    ProductInfo(
      name: "Lenovo IdeaPad Gaming",
      desc: "Windows i5 gen Ram:8gb Rom:512  core:8",
      image: "assets/laptop.png",
      price: 50000,
      color: "Blue | back",
      iscart: false,
      quantity: 1,
    ),
    ProductInfo(
      name: "Samsung Smart LED TV",
      desc:
          "Feel every shade of color as intended in powerful 4K, Crystal Processor 4K, See every shade of color in all its original glory with our advanced processor. Plus, powerful 4K upscaling ensures you get up to a 4K resolution for the content you love.",
      image: "assets/tv.png",
      price: 75000,
      color: "Red | Blue | back",
      iscart: false,
      quantity: 1,
    ),
  ];

  static List<ProductInfo> cart = [];

  static AuthService currentUser = AuthService(
    email: null,
    password: null,
    isLoggedIn: false,
    isGuest: false,
  );
}
