import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todoapp/framework/enums/categories.dart';
import 'package:todoapp/framework/localdatabase/store_data_locally.dart';
import 'package:todoapp/framework/model/task_details.dart';
import 'package:todoapp/framework/model/task_model.dart';

final getTaskDetails =
    StateNotifierProvider<TaskDetailsStateNotifier, TaskDetails>((ref) {
      return TaskDetailsStateNotifier();
    });

class TaskDetailsStateNotifier extends StateNotifier<TaskDetails> {
  TaskDetailsStateNotifier()
    : super(TaskDetails(allTask: [], filteredTask: []));

  // for add task
  void addTask(Task task) {
    state = state.copyWith(allTask: [task, ...state.allTask]);
  }

  void searchTask(String query) {
    if (query.isNotEmpty) {
      state = state.copyWith(filteredTask: state.allTask);
    }
    state = state.copyWith(
      filteredTask: state.allTask
          .where((ele) => ele.title.toLowerCase().contains(query.toLowerCase()))
          .toList(),
    );
  }

  // fetch filtered list when do any operation like delete,update
  void fetchFilteredList() {
    state = state.copyWith(filteredTask: state.allTask);
  }

  //Fetch data locally
  void fetchLocalData() async {
    List<Task> getData = await StoreDataLocally.getTask("task");
    state = state.copyWith(allTask: [...getData]);
    fetchFilteredList();
  }

  void sortList(String sortBy) {
    if (sortBy == "Completion") {
      List<Task> sortCompletion = [];

      state.filteredTask.forEach((ele) {
        if (ele.isCompleted) {
          sortCompletion.insert(0, ele);
        } else {
          sortCompletion.add(ele);
        }
      });
      state = state.copyWith(filteredTask: [...sortCompletion]);
    } else if (sortBy == "Date") {
      state.filteredTask.sort((a, b) {
        DateTime dateA = DateFormat("dd/MM/yyyy").parse(a.date);
        DateTime dateB = DateFormat("dd/MM/yyyy").parse(b.date);
        return dateA.compareTo(dateB);
      });

      state = state.copyWith(filteredTask: state.filteredTask);
    } else {
      print("clear");
      fetchLocalData();
    }
  }

  // addFilter
  void addFilter(Categories category, {String? sortBy}) {
    if (category.name == "All") {
      state = state.copyWith(filteredTask: state.allTask);
    } else if (category.name == "Completed") {
      state = state.copyWith(
        filteredTask: state.allTask.where((ele) {
          return ele.isCompleted;
        }).toList(),
      );
    } else {
      state = state.copyWith(
        filteredTask: state.allTask.where((ele) {
          return !ele.isCompleted;
        }).toList(),
      );
    }
    if (sortBy != null) {
      sortList(sortBy);
    }
  }

  // delete task
  void deleteTask(String id) {
    state.allTask.removeWhere((ele) => ele.id == id);
    state = state.copyWith(allTask: [...state.allTask]);
    StoreDataLocally.deleteTask(id, "task");
  }

  // for updateTask
  void updateTask(Task task) {
    print(task.isCompleted);
    StoreDataLocally.updateTask(task, "task");
    state = state.copyWith(
      allTask: state.allTask.map((ele) {
        if (ele.id == task.id) {
          return task;
        } else {
          return ele;
        }
      }).toList(),
    );
  }
}
