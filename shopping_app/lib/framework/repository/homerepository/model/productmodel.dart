
import '../../auth_repository/model/user_info_model.dart';
import '../enums/categories.dart';

// it is store the product information
class ProductDetails{
  final productId;
  int  quantity;
  int  orderQuantity;
  final String productName;
  final String? productDis;
  final List<String> productImage;
  final double productPrice;
  final Categories category ;
   bool addToCart;
  final bool isOrder;
  final bool isOffers;
   OrderFilter orderFilter;
  ProductDetails({required this.productName,this.orderFilter = OrderFilter.Pending ,this.orderQuantity=1,this.quantity=1,required this.productId,this.isOrder=false,this.addToCart=false,required this.category,this.productDis,required this.productImage,required this.productPrice,this.isOffers=false});

  ProductDetails copyWith({bool? addToCart,OrderFilter? orderFilter,bool? isOrder,int? quantity, String? productDis ,int? orderQuantity}){
    return ProductDetails(productName: productName, orderFilter: orderFilter??this.orderFilter,productId: productId, orderQuantity:orderQuantity ?? this.orderQuantity ,productDis: productDis??this.productDis,quantity: quantity??this.quantity,category: category, productImage: productImage, productPrice: productPrice,addToCart: addToCart??this.addToCart,isOrder: isOrder??this.isOrder);
  }

}