

import 'package:advancedshoppingapp/framework/enums/app_enum.dart';
import 'package:advancedshoppingapp/framework/model/about_item.dart';

class ProductDetails{

  final String productName;
  final String? productDis;
  final List<String> productImage;
  final double productPrice;
  bool isFavorite;
  final bool isOffers;
  final int rating;
  final Categories category ;
  final AboutItem? aboutItem;
  final bool addToCart;

   ProductDetails({required this.productName,this.addToCart=false,this.aboutItem,required this.category,this.productDis,required this.productImage,required this.productPrice,
      this.isFavorite=false, this.isOffers=false, this.rating=2});

}