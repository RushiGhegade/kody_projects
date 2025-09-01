import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/controller/change_notifier_provider.dart';

class Changenotifierproviderscreen extends ConsumerStatefulWidget {
  const Changenotifierproviderscreen({super.key});

  @override
  ConsumerState<Changenotifierproviderscreen> createState() =>
      _ChangenotifierproviderscreenState();
}

class _ChangenotifierproviderscreenState
    extends ConsumerState<Changenotifierproviderscreen> {
  @override
  Widget build(BuildContext context) {
    final getData = ref.watch(getUsers);
    return Scaffold(
      appBar: AppBar(title: Text("ChangeNotifier Provider")),
      body: ListView.builder(
        itemCount: getData.list.length,
        itemBuilder: (context, index) {
          User user = getData.list[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.dis),
            leading: Icon(Icons.person),
            trailing: SizedBox(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(getUsers)
                          .updateUser(
                            User(
                              id: user.id,
                              name: user.name,
                              dis: user.name,
                              isFavorite: !user.isFavorite,
                            ),
                          );
                    },
                    child: Icon(
                      Icons.favorite,
                      color: user.isFavorite ? Colors.red : Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(getUsers)
                          .updateUser(
                            User(
                              id: user.id,
                              name: "Update User",
                              dis: "Update User Data",
                              isFavorite: false,
                            ),
                          );
                    },
                    child: Icon(Icons.edit),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(getUsers).deleteUser(user.id);
                    },
                    child: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(getUsers)
              .addUser(
                User(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: "New User",
                  dis: "User Discription",
                  isFavorite: false,
                ),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
