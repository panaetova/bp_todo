import 'dart:collection';
import 'package:bp_todo/domain/color.dart';
import 'package:bp_todo/domain/project.dart';
import 'package:bp_todo/domain/task.dart';
import 'package:flutter/material.dart';

class ProjectData extends ChangeNotifier {
  List<Project> projects = [];


  UnmodifiableListView<Project> get _projects {
    return UnmodifiableListView(projects);
  }

  int get projectQuantity {
    return projects.length;
  }


  void createProject(String newProjectTitle, int color) {
    Project project = Project(title: newProjectTitle, color: color);
    projects.add(project);
    notifyListeners();
  }

  void deleteProject(Project project) {
    projects.remove(project);
    notifyListeners();
  }

}