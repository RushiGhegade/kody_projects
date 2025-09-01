

import 'package:todoapp/framework/model/task_model.dart';

class TaskDetails{

  final List<Task> allTask;
  final List<Task> filteredTask;

  TaskDetails({required this.allTask,required this.filteredTask});

  TaskDetails copyWith({List<Task>? allTask , List<Task>? filteredTask}){
    return TaskDetails(allTask: allTask?? this.allTask, filteredTask: filteredTask?? this.filteredTask);
  }

}