
import 'dart:typed_data';
import 'package:hive/hive.dart';
part 'user_information_model.g.dart';

@HiveType(typeId: 0)
class User{

  @HiveField(0)
  String id;

  @HiveField(1)
  UserInformation userInformation;

  @HiveField(2)
  List<UserProductInformation> userProductInformation;

  User({required this.id,required this.userInformation,required this.userProductInformation});

}

@HiveType(typeId: 1)
class UserProductInformation{

  @HiveField(0)
  String productId;

  @HiveField(1)
  bool isCart;

  @HiveField(2)
  bool order;

  @HiveField(3)
  int quantity;
  
  UserProductInformation({required this.productId,required this.isCart,required this.order,required this.quantity});
}

@HiveType(typeId: 2)
class UserInformation{

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final Uint8List uint8list;

  const UserInformation({required this.userName,required this.uint8list,required this.password});

}





