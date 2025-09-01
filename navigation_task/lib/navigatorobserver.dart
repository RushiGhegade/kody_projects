



import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver{

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print("pushed Route : ${route.settings.name}");
  }

  @override
  void didPop(Route<dynamic> route,Route<dynamic>? previousRoute){
    super.didPop(route, previousRoute);
    print("Pop Route : ${route.settings.name}");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute){
    super.didRemove(route, previousRoute);
    print("Remove Route :${route.settings.name}");
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}){
    // super.didReplace(newRoute,oldRoute);
    print("Repleace Route : ${newRoute!.settings.name}");

  }
}