import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/controller/future+provider_controller.dart';

class Futureproviderscreen extends ConsumerStatefulWidget {
  const Futureproviderscreen({super.key});

  @override
  ConsumerState<Futureproviderscreen> createState() =>
      _FutureproviderscreenState();
}

class _FutureproviderscreenState extends ConsumerState<Futureproviderscreen> {
  @override
  Widget build(BuildContext context) {
    final getdata = ref.watch(getDate);
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider")),
      body: getdata.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          return Center(child: Text(data));
        },
        error: (obj, stacktrace) {
          return Text("Error Detected");
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(getDate);
        },
        child: Text("Refresh", style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
