
import 'package:shopping_app/framework/controller/auth_controller/database_location_info.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_information_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/framework/utils/hive_init.dart';

import '../controller/homecontroller/home_controller.dart';


class LocalDatabaseHive{

  // Store the data in hive
  static void addData(User userInfo,String key)async{
    Box<User>  box = await  HiveInitialize.getBox();
    await box.put(key, userInfo);
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
      UserProductInformation userProductInformation1 = UserProductInformation(productId: proId, isCart: flag, order: false, quantity: 1);
      user.userProductInformation.add(userProductInformation1);
      box.put(id,user);
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
        UserProductInformation userProductInformation1 = UserProductInformation(productId: proId, isCart: flag, order: false, quantity: 1);
        user.userProductInformation.add(userProductInformation1);
        box.put(id,user);
      }else{
        print("add to cart 3");
        user.userProductInformation = userProductInformation;
        box.put(id, user);
      }
    }
  }

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

  static void getFirstTimeData(String id)async{
    Box<User>  box = await  HiveInitialize.getBox();
    User user =  box.get(id)!;
    List<UserProductInformation> productsData = [...user.userProductInformation];
    print(productsData.length);
    for(int i=0;i<products.length;i++){
      // print("Reach");
      UserProductInformation? userInfo =  findId(productsData,products[i].productId);
      if(userInfo!= null){
        print(userInfo.isCart);
        products[i] = products[i].copyWith(addToCart: userInfo.isCart,isOrder: userInfo.order,quantity: userInfo.quantity);
        print(products[i].addToCart);
      }
    }
    print("Data Fetch");

  }

  static void updateDataQuantity(String id,String proId,int quantity)async{
    Box<User>  box =await  HiveInitialize.getBox();

    User user = box.get(id)!;

    List<UserProductInformation> userProductInformation = user.userProductInformation;

    if(userProductInformation.isEmpty){
      UserProductInformation userProductInformation1 = UserProductInformation(productId: proId, isCart: true, order: false, quantity: quantity);
      user.userProductInformation.add(userProductInformation1);
      box.put(id,user);
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
        UserProductInformation userProductInformation1 = UserProductInformation(productId: proId, isCart: true, order: false, quantity: quantity);
        user.userProductInformation.add(userProductInformation1);
        box.put(id,user);
        print("Quantity update 2");
      }else{
        user.userProductInformation = userProductInformation;
        box.put(id, user);
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