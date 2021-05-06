import 'package:bp_todo/domain/task.dart';

class Label {
  String title;
  int color;
  bool isChecked = false;
  List<Task> tasks = [];

  Label({this.title, this.color});

  void updateLabel(Label label) {
    label.tasks = label.tasks.toSet().toList();
  }
}

