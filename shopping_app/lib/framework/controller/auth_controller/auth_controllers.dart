

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/local_database_sharedpreferance.dart';


final getUserCredential = FutureProvider<Credential>((ref)async{

  bool isLogin = (await LocalDataBaseSharedPref.getCredential()).isLogin;
  String id =  (await LocalDataBaseSharedPref.getCredential()).id;

  return Credential(isLogin: isLogin, id: id);
});

class Credential{
  final bool isLogin;
  final String id;

  Credential({required this.isLogin,required this.id});

  Credential copyWith({bool? isLogin,String? id}){
    return Credential(isLogin: isLogin??this.isLogin, id: id??this.id);
  }
}


class AuthControllers{


static final formKey = GlobalKey<FormState>();
static final formKeyCreateAccountMobile = GlobalKey<FormState>();
static final formKeyLoginWeb = GlobalKey<FormState>();
static final formKeyCreateAccountWeb = GlobalKey<FormState>();


}