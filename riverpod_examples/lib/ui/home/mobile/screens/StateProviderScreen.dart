import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/controller/state_provider_controller.dart';
import 'package:riverpod_examples/freamwork/enums/ipl_teams.dart';

class Stateproviderscreen extends ConsumerStatefulWidget {
  const Stateproviderscreen({super.key});

  @override
  ConsumerState<Stateproviderscreen> createState() =>
      _StateproviderscreenState();
}

class _StateproviderscreenState extends ConsumerState<Stateproviderscreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    final getdata = ref.watch(favoriteTeamProvider);
    return Scaffold(
      appBar: AppBar(title: Text("State Provider")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode "),
                SizedBox(
                  height: 30,
                  width: 40,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Switch(
                      value: getdata.isdark,
                      onChanged: (v) {
                        print("Get Call");
                        ref.read(favoriteTeamProvider.notifier).state = ref
                            .read(favoriteTeamProvider.notifier)
                            .state
                            .copyWith(isdark: v);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              child: DropdownButton(
                padding: EdgeInsets.zero,

                icon: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: getdata.isdark ? Colors.white : Colors.black,
                    ),
                    Text(
                      "Select Your Favorite Team",
                      style: TextStyle(
                        color: getdata.isdark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                iconSize: 40,
                iconEnabledColor: const Color.fromARGB(255, 71, 57, 57),
                elevation: 0,
                items: IPLTeamsNames.values.map((ele) {
                  return DropdownMenuItem(
                    value: ele.name,
                    child: Text(ele.name),
                  );
                }).toList(),
                onChanged: (v) {
                  ref.read(favoriteTeamProvider.notifier).state = ref
                      .read(favoriteTeamProvider.notifier)
                      .state
                      .copyWith(favoriteTeamName: v.toString());
                },
              ),
            ),
            if (getdata.favoriteTeamName.isNotEmpty)
              Text("Your Favorite Team : ${getdata.favoriteTeamName}"),
          ],
        ),
      ),
    );
  }
}
