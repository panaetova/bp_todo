import 'package:bp_todo/domain/label.dart';
import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final List<Label> labels;

  const LabelWidget({Key key, @required this.labels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: labelList().toList(),
    );
  }

  Iterable<Widget> labelList() sync* {
    for (final Label label in labels) {
      yield Text(label.title);
    }
  }
}
