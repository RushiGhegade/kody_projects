import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/framework/model/task_model.dart';

class StoreDataLocally {
  static Future<bool> isContainsKey(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(key);
  }

  static Map convertMap(Task task) {
    return {
      'id': task.id,
      'title': task.title,
      'dis': task.dis,
      'time': task.time,
      'date': task.date,
      'isCompleted': task.isCompleted,
    };
  }

  static void addTask(Task task, String key) async {
    print(task.isCompleted);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (await isContainsKey(key)) {
      List<Task> getAllMessage = [];
      // getAllMessage.add(task);
      // getAllMessage = await getTask(key);
      getAllMessage = [task, ...await getTask(key)];

      List<Map> map = getAllMessage.map((ele) => convertMap(ele)).toList();
      String str = jsonEncode(map);
      sharedPreferences.setString(key, str);
    } else {
      String str = jsonEncode(task.toJson());
      sharedPreferences.setString(key, str);
    }
    print("Data Added");
  }

  static void deleteTask(String id, String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (await isContainsKey(key)) {
      List<Task> getAllMessage = await getTask(key);
      getAllMessage.removeWhere((ele) => ele.id == id);
      List<Map> map = getAllMessage.map((ele) {
        return convertMap(ele);
      }).toList();
      String str = jsonEncode(map);
      sharedPreferences.setString(key, str);
    } else {
      print("Data Not Present ");
    }
  }

  static void updateTask(Task task, String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (await isContainsKey(key)) {
      List<Task> getAllMessage = await getTask(key);

      List<Map> map = getAllMessage.map((ele) {
        if (ele.id == task.id) {
          return convertMap(task);
        } else {
          return convertMap(ele);
        }
      }).toList();
      String str = jsonEncode(map);
      sharedPreferences.setString(key, str);
    } else {
      print("Not Data Present");
    }
    print("Data Updated");
  }

  static Future<List<Task>> getTask(String key) async {
    print("Method call");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (await isContainsKey(key)) {
      String getMessage = sharedPreferences.getString(key)!;

      dynamic getMap = jsonDecode(getMessage);
      print(getMap);
      if (getMap is Map) {
        print("1st time");
        return [
          Task(
            id: getMap['id'],
            title: getMap['title'],
            time: getMap['time'],
            dis: getMap['dis'],
            date: getMap['date'],
            isCompleted: getMap['isCompleted'],
          ),
        ];
      }
      if (getMap is List<dynamic>) {
        print("2nd time");
        return getMap
            .map(
              (ele) => Task(
                id: ele['id'],
                title: ele['title'],
                time: ele['time'],
                dis: ele['dis'],
                date: ele['date'],
                isCompleted: ele['isCompleted'],
              ),
            )
            .toList();
      }
    }
    return [];
  }
}
