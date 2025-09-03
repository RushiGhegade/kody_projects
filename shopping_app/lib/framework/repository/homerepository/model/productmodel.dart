import '../enums/categories.dart';

class ProductDetails{
  final productId;
  int  quantity;
  final String productName;
  final String? productDis;
  final List<String> productImage;
  final double productPrice;
  final Categories category ;
   bool addToCart;
  final bool isOrder;
  final bool isOffers;

  ProductDetails({required this.productName,this.quantity=1,required this.productId,this.isOrder=false,this.addToCart=false,required this.category,this.productDis,required this.productImage,required this.productPrice,this.isOffers=false});

  ProductDetails copyWith({bool? addToCart,bool? isOrder,int? quantity, String? productDis }){
    return ProductDetails(productName: productName, productId: productId, productDis: productDis??this.productDis,quantity: quantity??this.quantity,category: category, productImage: productImage, productPrice: productPrice,addToCart: addToCart??this.addToCart,isOrder: isOrder??this.isOrder);
  }

}