
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:shopping_app/framework/utils/hive_init.dart';

import '../controller/homecontroller/home_controller.dart';

import 'dart:typed_data';

// these class manage the hive all operation
class LocalDatabaseHive{

  // Store the data in hive
  static void addData(User userInfo,String key)async{
    Box<User>  box = await  HiveInitialize.getBox();
    await box.put(key, userInfo);
  }


  // it fetch the user profile data
  static Future<UserInformation> getUserProfileData(String userId)async{

    Box<User>  box =await  HiveInitialize.getBox();

    User user = box.get(userId)!;

    UserInformation userInformation = user.userInformation;

    return userInformation;

  }

  // clear the box
  void clearBox()async{
    Box<User>  box =await  HiveInitialize.getBox();
    box.clear();
    print("Box Data Clear");
  }

  // get only specificuser
  static Future<User?> getCurrentUserData(String id)async{
    Box<User>  box =await  HiveInitialize.getBox();

    return box.get(id);
  }

  // Get All Data
  static Future<List<User>> getData(String userId)async{
    Box<User>  box =await  HiveInitialize.getBox();
    return box.values.toList();
  }

  // add in cart
  static void updateDataAddToCart(String id,String proId,bool flag)async{
    Box<User>  box =await  HiveInitialize.getBox();

    User user = box.get(id)!;

    List<UserProductInformation> userProductInformation = user.userProductInformation;

    if(userProductInformation.isEmpty){
      print("add to cart 1");
      UserProductInformation userProductInformation1 = UserProductInformation(productId: proId,orderQuality: 1, isCart: flag, order: false, quantity: 1);
      user.userProductInformation.add(userProductInformation1);
     await box.put(id,user);
    }else{

      bool present = false;

      for(int i=0;i<userProductInformation.length;i++){
        if(userProductInformation[i].productId==proId){
          userProductInformation[i].isCart=flag;
          present=true;
          break;
        }
      }
      if(!present){
        print("add to cart 2");
        UserProductInformation userProductInformation1 = UserProductInformation(productId: proId, orderQuality: 1,isCart: flag, order: false, quantity: 1);
        user.userProductInformation.add(userProductInformation1);
        await box.put(id,user);
      }else{
        print("add to cart 3");
        user.userProductInformation = userProductInformation;
        await box.put(id, user);
      }
    }
  }

  // these function  get user id
  static UserProductInformation? findId(List<UserProductInformation> prod,String id){

    for(int i=0;i<prod.length;i++){
      print("${prod[i].productId }     $id}");
      if(prod[i].productId == id){
        print("get");
        return prod[i];
      }
    }

    return null;

  }

  // these fuction chnage the delivary status
  static Future<void> changeDeliveryStatus(OrderFilter orderFilter,String proId,String id)async{
    Box<User>  box =await  HiveInitialize.getBox();
    User user = box.get(id)!;
    List<UserProductInformation> userProInfo =  user.userProductInformation;
    for(int i=0;i<userProInfo.length;i++){
      if(userProInfo[i].productId == proId){
        print("Change Delivery Status");
        print(userProInfo[i].orderFilter);
        userProInfo[i].orderFilter = orderFilter;
        print(userProInfo[i].orderFilter);
      }
    }
    user.userProductInformation = [...userProInfo];
    await box.put(id, user);
    await getFirstTimeData(id);
  }



  // when user come these fetch the first time data
  static Future<void> getFirstTimeData(String id)async{
    Box<User>  box = await  HiveInitialize.getBox();
    User user =  box.get(id)!;
    // print("${id} ${user.userProductInformation[0].order} ${user.userProductInformation[0].isCart}");
    List<UserProductInformation> productsData = [...user.userProductInformation];
    print(productsData);
    print(productsData.length);
    for(int i=0;i<products.length;i++){
      // print(productsData[i].orderFilter);
      UserProductInformation? userInfo =  findId(productsData,products[i].productId);
      if(userInfo!= null){

        products[i] = products[i].copyWith(addToCart: userInfo.isCart,orderFilter: userInfo.orderFilter,orderQuantity: userInfo.orderQuality,isOrder: userInfo.order,quantity: userInfo.quantity);

      }
    }
    print("Data Fetch");

  }

  // these function change the image in hive
  static Future<void> changeImage(String id, Uint8List image)async{
    Box<User>  box = await  HiveInitialize.getBox();
    User user =  box.get(id)!;

    user.userInformation.uint8list = image;

    await box.put(id, user);

  }

  // after check out these fuction call to clear the cart
  static Future<void> clearCartAndOrder(String id)async{
    Box<User>  box = await  HiveInitialize.getBox();
    User user =  box.get(id)!;

    List<UserProductInformation> userInfo = user.userProductInformation;

    for(int i=0;i<userInfo.length;i++){
      userInfo[i].isCart = false;
      userInfo[i].orderQuality = userInfo[i].quantity;
      userInfo[i].quantity = 1;
      userInfo[i].orderFilter =  userInfo[i].orderFilter;
      userInfo[i].order = true;
    }

    user.userProductInformation = [...userInfo];
    print("Clear cart");
    await box.put(id, user);
    await getFirstTimeData(id);
  }

  // htese function uodate the quantity of the product
  static void updateDataQuantity(String id,String proId,int quantity)async{
    Box<User>  box =await  HiveInitialize.getBox();

    User user = box.get(id)!;

    List<UserProductInformation> userProductInformation = user.userProductInformation;

    if(userProductInformation.isEmpty){
      UserProductInformation userProductInformation1 = UserProductInformation(productId: proId,orderQuality: 1, isCart: true, order: false, quantity: quantity);
      user.userProductInformation.add(userProductInformation1);
      await box.put(id,user);
      print("Quantity update 1");
    }else{
      bool present = false;

      for(int i=0;i<userProductInformation.length;i++){
        if(userProductInformation[i].productId==proId){
          userProductInformation[i].quantity = quantity;
          present=true;
          break;
        }
      }
      if(!present){
        UserProductInformation userProductInformation1 = UserProductInformation(productId: proId, orderQuality: 1, isCart: true, order: false, quantity: quantity);
        user.userProductInformation.add(userProductInformation1);
        await box.put(id,user);
        print("Quantity update 2");
      }else{
        user.userProductInformation = userProductInformation;
        await box.put(id, user);
        print("Quantity update 3");
      }
    }
  }

  // check user id present or not
  static Future<String> isUserPresent(String userName,String password)async{

    Box<User>  box =await  HiveInitialize.getBox();

    if(box.containsKey(userName)){
      if(box.get(userName)!.userInformation.password ==password){
        return 'valid';
      }else{
        return 'Invalid Password';
      }
    }else{
      return "Invalid Email";
    }
  }



}