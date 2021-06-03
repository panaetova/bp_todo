import 'package:bp_todo/domain/project-data.dart';
import 'package:bp_todo/domain/project.dart';
import 'package:bp_todo/domain/section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewSectionScreen extends StatefulWidget {
  final Project project;

  AddNewSectionScreen({Key key, @required this.project}) : super(key: key);

  @override
  _AddNewSectionScreenState createState() => _AddNewSectionScreenState(project);
}

class _AddNewSectionScreenState extends State<AddNewSectionScreen> {
  Project project;
  String newSectionName;

  _AddNewSectionScreenState(this.project);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          color: Color(0xFF737373),
          height: 100,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child:  Row(
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
                        newSectionName = value;
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
                          if (newSectionName != null) {
                            Section section = new Section(title: newSectionName);
                            project.sections.add(section);
                            Navigator.of(context).pop();
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
