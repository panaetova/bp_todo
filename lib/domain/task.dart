import 'dart:collection';
import 'package:bp_todo/domain/priority-choices.dart';
import 'day.dart';
import 'label.dart';

class Task {
  String title;
  bool isDone;
  Priority priority;
  DateTime dateTime;
  List<Label> labels = [];
  List<String> notes = [];
  List<String> subtasks = [];
  List<String> finishedSubtasks = [];
  bool isCheckedLabel = false;

  Task({this.title, this.isDone = false, this.priority, this.dateTime});

  void doneTask() {
    isDone = !isDone;
  }

  void updateLabels() {
    labels = labels.toSet().toList();
  }

  UnmodifiableListView<String> get _notes {
    return UnmodifiableListView(notes);
  }

  UnmodifiableListView<String> get _subtasks {
    return UnmodifiableListView(subtasks);
  }

  UnmodifiableListView<String> get _finishedSubtasks {
    return UnmodifiableListView(finishedSubtasks);
  }
}