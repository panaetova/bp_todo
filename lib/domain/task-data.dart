import 'dart:collection';
import 'package:bp_todo/domain/day-data.dart';
import 'package:bp_todo/domain/day.dart';
import 'package:bp_todo/domain/task.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasksPriority1 = [];
  List<Task> tasksPriority2 = [];
  List<Task> tasksPriority3 = [];
  List<Task> tasksDefault = [];


  UnmodifiableListView<Task> get _tasksDefault {
    return UnmodifiableListView(tasksDefault);
  }

  UnmodifiableListView<Task> get _tasksPriority1 {
    return UnmodifiableListView(tasksPriority1);
  }

  UnmodifiableListView<Task> get _tasksPriority2 {
    return UnmodifiableListView(tasksPriority2);
  }

  UnmodifiableListView<Task> get _tasksPriority3 {
    return UnmodifiableListView(tasksPriority3);
  }

  int get taskQuantity {
    return tasksDefault.length;
  }

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
    notifyListeners();
  }

  void deleteTask(Task task, DayData dayData) {
    for (final Day day in dayData.days) {
      if(day.tasksPriority1.contains(task)) {
        day.tasksPriority1.remove(task);
      } else if(day.tasksPriority2.contains(task)) {
        day.tasksPriority2.remove(task);
      } else if(day.tasksPriority3.contains(task)) {
        day.tasksPriority3.remove(task);
      } else if(day.tasksDefault.contains(task)) {
        day.tasksDefault.remove(task);
      }
    }

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
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneTask();
    notifyListeners();
  }

}