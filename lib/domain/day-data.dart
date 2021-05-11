import 'dart:collection';
import 'package:bp_todo/domain/day.dart';
import 'package:flutter/material.dart';

class DayData extends ChangeNotifier {
  List<Day> days = [];

  UnmodifiableListView<Day> get _days {
    return UnmodifiableListView(days);
  }

  void addDay(Day day) {
    days.add(day);
    notifyListeners();
  }
}