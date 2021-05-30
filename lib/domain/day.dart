import 'package:bp_todo/domain/task.dart';
import 'package:flutter/cupertino.dart';

class Day {
  DateTime dateTime;
  List<Task> tasksPriority1 = [];
  List<Task> tasksPriority2 = [];
  List<Task> tasksPriority3 = [];
  List<Task> tasksDefault = [];

  Day({@required this.dateTime});

  void addTask(Task task) {
    switch(task.priority.id) {
      case 1:
        tasksPriority1.add(task);
        break;
      case 2:
        tasksPriority2.add(task);
        break;
      case 3:
        tasksPriority3.add(task);
        break;
      case 4:
        tasksDefault.add(task);
        break;
    }
  }

  void deleteTask(Task task) {
    switch(task.priority.id) {
      case 1:
        tasksPriority1.remove(task);
        break;
      case 2:
        tasksPriority2.remove(task);
        break;
      case 3:
        tasksPriority3.remove(task);
        break;
      case 4:
        tasksDefault.remove(task);
        break;
    }
  }
}