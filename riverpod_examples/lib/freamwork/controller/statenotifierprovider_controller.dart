import 'package:flutter_riverpod/flutter_riverpod.dart';

final productdata = StateNotifierProvider<Product, List<Item>>((ref) {
  return Product();
});

class Product extends StateNotifier<List<Item>> {
  Product() : super([]);


  // add item in List
  void addItem(Item newitem) {
    state = [...state, newitem];
  }

  // delete item in list
  void deleteItem(int id) {
    state = state.where((ele) => ele.id != id).toList();
  }

  void update(Item item) {
    state = state.map((ele) {
      if (ele.id == item.id) {
        return item;
      }
      return ele;
    }).toList();
  }
}

class Item {
  final int id;
  final String name;
  final String dis;
  final bool isfavorite;

  const Item({
    required this.id,
    required this.name,
    required this.dis,
    required this.isfavorite,
  });

  Item copyWith({String? name, String? dis, bool? isfavorite}) {
    return Item(
      id: id,
      name: name ?? this.name,
      dis: dis ?? this.dis,
      isfavorite: isfavorite ?? this.isfavorite,
    );
  }
}
