
import 'package:flutter/material.dart';
import '../../../ui/home/home_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../homecontroller/home_controller_provider.dart';

class SplashScreenController{

  // context required for navigation
  BuildContext context;

  SplashScreenController({required this.context});

  /// here navigate from splash screen to homeScreen
  void navigationToHomeScreenAfterDelay(WidgetRef ref){

    Future.delayed(Duration(seconds: 1),(){

      ref.read(apisOperationProvider.notifier).getAllResponseApi();

      if(context.mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return HomeScreen();
          }));

      }

    });


  }

}