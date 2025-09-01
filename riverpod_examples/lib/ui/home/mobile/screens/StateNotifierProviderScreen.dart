import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/controller/statenotifierprovider_controller.dart';

class Statenotifierproviderscreen extends ConsumerStatefulWidget {
  const Statenotifierproviderscreen({super.key});

  @override
  ConsumerState<Statenotifierproviderscreen> createState() =>
      _StatenotifierproviderscreenState();
}

class _StatenotifierproviderscreenState
    extends ConsumerState<Statenotifierproviderscreen> {
  @override
  Widget build(BuildContext context) {
    final getItems = ref.watch(productdata);
    return Scaffold(
      appBar: AppBar(title: Text("StateNotifierProvider")),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: getItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(getItems[index].name),
            subtitle: Text(getItems[index].dis),
            leading: Icon(Icons.insert_emoticon),
            trailing: SizedBox(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(productdata.notifier)
                          .update(
                            Item(
                              id: getItems[index].id,
                              name: getItems[index].name,
                              dis: getItems[index].dis,
                              isfavorite: !getItems[index].isfavorite,
                            ),
                          );
                    },
                    child: Icon(
                      Icons.favorite,
                      color: getItems[index].isfavorite
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(productdata.notifier)
                          .update(
                            Item(
                              id: getItems[index].id,
                              name: "Update Product",
                              dis: "Updated",
                              isfavorite: false,
                            ),
                          );
                    },
                    child: Icon(Icons.edit),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(productdata.notifier)
                          .deleteItem(getItems[index].id);
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
              .read(productdata.notifier)
              .addItem(
                Item(
                  id: DateTime.now().millisecond,
                  name: "New Item",
                  dis: "These is Good Item",
                  isfavorite: false,
                ),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
