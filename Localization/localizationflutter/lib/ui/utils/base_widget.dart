import 'package:flutter/material.dart';

mixin BaseStatelessWidget on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildPage(context));
  }

  Widget buildPage(BuildContext context);
}

mixin BaseStatfulWidget<Page extends StatefulWidget> on State<Page> {
  @override
  void initState() {
    print("Base Widget Init");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildPage(context));
  }

  Widget buildPage(BuildContext context);
}
