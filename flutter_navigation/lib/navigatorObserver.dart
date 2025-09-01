import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  List<Route> list = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    list.add(route);

    print("pushed Route : ${route.settings.name}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    list.remove(route);

    super.didPop(route, previousRoute);
    print("Pop Route : ${route.settings.name}");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);

    list.remove(route);

    print("Remove Route :${route.settings.name}");
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // super.didReplace(newRoute,oldRoute);

    list.remove(oldRoute);
    list.add(newRoute!);

    print("Repleace Route : ${newRoute!.settings.name}");
  }

  void printNavigatorStack() {
    print("Function start");

    print(list);

    print("Function End");
  }
}
