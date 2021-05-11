import 'package:bp_todo/domain/task.dart';

class Day {
  DateTime dateTime;
  List<Task> tasks = [];

  Day({this.dateTime});

  void addTask(Task task) {
    tasks.add(task);
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }
}