
import 'package:flutter/material.dart';
import 'package:https_methods_implements/framework/controller/homecontroller/home_controller_provider.dart';

import '../../../ui/home/home_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenController{

  // context required for navigation
  BuildContext context;

  SplashScreenController({required this.context});

  /// here navigate from splash screen to homeScreen
  void navigationToHomeScreenAfterDelay(WidgetRef ref){

    Future.delayed(Duration(seconds: 1),(){

      if(context.mounted){
        ref.read(apisOperationProvider.notifier).getAllResponseApi();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return HomeScreen();
          }));

      }

    });


  }

}