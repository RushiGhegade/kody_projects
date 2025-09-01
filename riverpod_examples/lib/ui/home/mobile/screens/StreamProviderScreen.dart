import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/controller/stream_provider_controller.dart';

class Streamproviderscreen extends ConsumerStatefulWidget {
  const Streamproviderscreen({super.key});

  @override
  ConsumerState<Streamproviderscreen> createState() =>
      _StreamproviderscreenState();
}

class _StreamproviderscreenState extends ConsumerState<Streamproviderscreen> {
  @override
  Widget build(BuildContext context) {
    final getData = ref.watch(getStreamData);
    return Scaffold(
      appBar: AppBar(title: Text("Stream Provider")),
      body: Center(
        child: getData.when(
          skipLoadingOnRefresh: false,
          data: (data) {
            return Text("${data[0]} : ${data[1]}");
          },
          error: (obj, st) {
            return Text("$st");
          },
          loading: () {
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(getStreamData);
        },
        child: Text("Refresh", style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
