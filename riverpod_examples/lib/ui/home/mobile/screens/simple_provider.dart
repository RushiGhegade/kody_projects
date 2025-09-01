import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/controller/simple_provider_controller.dart';

class SimpleProvider extends ConsumerStatefulWidget {
  const SimpleProvider({super.key});

  @override
  ConsumerState<SimpleProvider> createState() => _SimpleProviderState();
}

class _SimpleProviderState extends ConsumerState<SimpleProvider> {
  @override
  Widget build(BuildContext context) {
    List<IplTeam> getTeams = ref.watch(getIplTeams);

    return Scaffold(
      appBar: AppBar(title: Text("Provider")),
      body: ListView.builder(
        itemCount: getTeams.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: ListTile(
              tileColor: Colors.white,
              title: Text(getTeams[index].teamsName.name),
              subtitle: Text(getTeams[index].dis),
              leading: Icon(getTeams[index].image),
            ),
          );
        },
      ),
    );
  }
}
