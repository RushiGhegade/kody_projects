import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUsers = ChangeNotifierProvider<Users>((ref) {
  return Users();
});

class Users extends ChangeNotifier {
  List<User> list = [];

  void addUser(User user) {
    list.add(user);
    notifyListeners();
  }

  void deleteUser(int id) {
    list.removeWhere((ele) => ele.id == id);
    notifyListeners();
  }

  void updateUser(User user) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].id == user.id) {
        list[i] = user;
      }
    }
    notifyListeners();
  }
}

class User {
  int id;
  String name;
  String dis;
  bool isFavorite;

  User({
    required this.id,
    required this.name,
    required this.dis,
    required this.isFavorite,
  });

  User copyWith({String? name, bool? isFavorite}) {
    return User(
      id: this.id,
      name: name ?? this.name,
      dis: dis,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
