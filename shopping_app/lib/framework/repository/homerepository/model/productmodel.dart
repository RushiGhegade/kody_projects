import '../enums/categories.dart';

class ProductDetails{
  final productId;
  final String productName;
  final String? productDis;
  final List<String> productImage;
  final double productPrice;
  final Categories category ;
  final bool addToCart;
  final bool isOrder;
  final bool isOffers;

  ProductDetails({required this.productName,required this.productId,this.isOrder=false,this.addToCart=false,required this.category,this.productDis,required this.productImage,required this.productPrice,this.isOffers=false});

}