import 'package:bp_todo/domain/label.dart';
import 'package:flutter/material.dart';

class LabelInTaskWidget extends StatelessWidget {
  final List<Label> labels;

  const LabelInTaskWidget({Key key, @required this.labels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: labelList().toList(),
    );
  }

  Iterable<Widget> labelList() sync* {
    for (final Label label in labels) {
      yield Row(
        children: [
          Text(label.title, style: TextStyle(fontSize: 12, color: Color(label.color)),),
          SizedBox(width: 3,),
        ],
      );
    }
  }
}
