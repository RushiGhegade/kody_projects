
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';

import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';
import 'package:shopping_app/framework/utils/local_database_sharedpreferance.dart';

import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1),()async{
      Credential credential =  await LocalDataBaseSharedPref.getCredential();
      //  LocalDataBaseSharedPref.clearPrefs();
      // LocalDatabaseHive().clearBox();


      Future.delayed(Duration(seconds: 3),()async{

        if(await LocalDataBaseSharedPref.isUserLogin()){
          print("Login");
         await LocalDatabaseHive.getFirstTimeData(credential.id);
          ref.read(productListProvider.notifier).addData();
          CustomNavigation.homeScreen(context);
        }else{
          print("Not Login");
          CustomNavigation.loginScreen(context);
          // CustomNavigation.homeScreen(context);
        }
        ref.read(productListProvider.notifier).addData();
      });
    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/images/buy.png",height: 150,width: 150, fit: BoxFit.cover)),
    );
  }
}