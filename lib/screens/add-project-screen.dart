import 'package:bp_todo/domain/color-list.dart';
import 'package:bp_todo/domain/color.dart';
import 'package:bp_todo/domain/project-data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewProjectScreen extends StatefulWidget {
  @override
  _NewProjectScreenState createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  String newProjectTitle;
  bool visibleColors = false;
  ColorForList newColor = new ColorForList(color: 0xFF808080);

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
            for (final ColorForList check in colors) {
              if (check.isChecked == true)
                check.isChecked = false;
            }
            color.isChecked = !color.isChecked;
            newColor = color;
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
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          color: Color(0xFF737373),
          height: visibleColors ? 210 : 140,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context)
                            .size
                            .width -
                            65,
                        child: TextField(
                          style:
                          TextStyle(fontSize: 20.0),
                          cursorHeight: 20.0,
                          onChanged: (value) {
                            newProjectTitle = value;
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              if(newProjectTitle!= null) {
                                if (visibleColors == false) {
                                  Provider.of<ProjectData>(context, listen: false)
                                      .createProject(
                                      newProjectTitle, 0xFF808080);
                                } else
                                  Provider.of<ProjectData>(context, listen: false)
                                      .createProject(
                                      newProjectTitle, newColor.color);
                                Navigator.of(context).pop();
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  ListTile(
                      leading: visibleColors
                          ? Icon(Icons.palette_outlined, color: Color(newColor.color),)
                        : Icon(Icons.palette_outlined, color: Color(0xFF808080),),
                      title: Text("Color"),
                      trailing: visibleColors
                          ? Icon(Icons.keyboard_arrow_down_outlined)
                          : Icon(Icons.keyboard_arrow_left_outlined),
                      onTap: () {
                        setState(() {
                          visibleColors = !visibleColors;
                        });
                      }
                  ),
                  Visibility(
                    visible: visibleColors,
                      child: Wrap(
                      runSpacing: 10.0,
                      children: getColor.toList(),
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
