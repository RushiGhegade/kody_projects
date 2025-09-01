import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todoapp/framework/controller/task_details_controller.dart';

final getDateTime = Provider<List<String>>((ref) {
  return GetTimeDay.getTimeDate();
});

class GetTimeDay {
  static List<String> getTimeDate() {
    DateTime dateTime = DateTime.now();
    String date = DateFormat('dd/MM/yyyy').format(dateTime);
    String day = DateFormat('EEEE').format(dateTime);
    return [date, day];
  }
}

final totalMessageCount = StateProvider<List>((ref) {
  final getTask = ref.watch(getTaskDetails);
  print("---- ${getTask.allTask}");

  int completed = 0;
  int totalCount = 0;

  getTask.allTask.forEach((ele) {
    if (ele.isCompleted) {
      completed++;
    }
    totalCount++;
  });

  return [completed, totalCount];
});
