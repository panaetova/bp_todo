import 'dart:collection';

import 'package:bp_todo/domain/task.dart';

class Section {
  String title;
  List<Task> tasks = [];

  Section({this.title});

  UnmodifiableListView<Task> get _tasks {
    return UnmodifiableListView(tasks);
  }
}