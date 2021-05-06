import 'package:bp_todo/domain/section.dart';
import 'package:bp_todo/domain/task.dart';

class Project {
  String title;
  int color;
  List<Section> sections = [];
  List<Task> tasks = [];

  Project({this.title, this.color});

  void addTaskToProject(Task task, Project project) {
    project.tasks.add(task);
  }
}