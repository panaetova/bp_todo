import 'package:bp_todo/domain/task.dart';
import 'package:flutter/cupertino.dart';

class Label {
  String title;
  int color;
  bool isChecked = false;
  List<Task> tasks = [];

  Label({@required this.title, @required this.color});

  void updateLabel(Label label) {
    label.tasks = label.tasks.toSet().toList();
  }
}

