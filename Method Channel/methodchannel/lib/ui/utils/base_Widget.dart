import 'package:flutter/material.dart';

/// base stateless widget
mixin BaseStatelessWidget on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Method Channel")),
      body: buildPage(context),
    );
  }

  Widget buildPage(BuildContext context);
}


/// Base stateful widget
mixin BaseStatefulWidget<Page extends StatefulWidget> on State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Method Channel")),
      body: buildPage(context),
    );
  }

  Widget buildPage(BuildContext context);
}
