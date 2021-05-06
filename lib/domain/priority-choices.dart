import 'package:flutter/material.dart';

class Priority {
  String priorityName;
  IconData iconData;
  int color;
  int id;

  Priority({this.priorityName, this.iconData, this.color, this.id});
}

final List<Priority> menuPriority = [
  Priority(priorityName: "Priority 1", iconData: Icons.flag, color: 0xFFfe7968, id: 1),
  Priority(priorityName: "Priority 2", iconData: Icons.flag, color: 0xFFe8a628, id: 2),
  Priority(priorityName: "Priority 3", iconData: Icons.flag, color: 0xFFfddca5, id: 3),
  Priority(priorityName: "Priority 4", iconData: Icons.flag, color: 0xFFc1c8c7, id: 4),
];