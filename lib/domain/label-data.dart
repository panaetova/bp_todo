import 'dart:collection';
import 'package:bp_todo/domain/label.dart';
import 'package:flutter/material.dart';

class LabelData extends ChangeNotifier {
  List<Label> labels = [];

  UnmodifiableListView<Label> get _labels {
    return UnmodifiableListView(labels);
  }

  void addLabel(String labelName) {
    Label label = new Label(title: labelName);
    labels.add(label);
    notifyListeners();
  }

  void deleteLabel(Label label) {
    //возможно придется сделать еще удаление лейбла из таска
    labels.remove(label);
    notifyListeners();

  }



}