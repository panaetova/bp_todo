import 'package:bp_todo/domain/color.dart';
import 'package:flutter/material.dart';

class ColorList extends StatefulWidget {
  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  final List<ColorForList> colors = <ColorForList>[
    ColorForList(color: 0xFF808080),
    ColorForList(color: 0xFF6da545),
    ColorForList(color: 0xFFd5adfb),
    ColorForList(color: 0xFFf90052),
    ColorForList(color: 0xFF133072),
    ColorForList(color: 0xFFd5e6f7),
    ColorForList(color: 0xFFFF7751),
    ColorForList(color: 0xFFf9de59),
  ];

  Iterable<Widget> get getColor sync* {
    for (final ColorForList color in colors) {
      yield InkWell(
        onTap: () {
          setState(() {
            color.isChecked = !color.isChecked;
          });
        },
        child: color.isChecked
            ? Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Color(color.color),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2)),
                )
            : Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Color(color.color),
                  shape: BoxShape.circle,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10.0,
      children: getColor.toList(),
    );
  }
}
