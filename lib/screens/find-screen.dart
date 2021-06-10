import 'package:bp_todo/domain/day-data.dart';
import 'package:bp_todo/domain/project-data.dart';
import 'package:bp_todo/domain/task-data.dart';
import 'package:bp_todo/domain/task.dart';
import 'package:bp_todo/screens/data-task-screen.dart';
import 'package:bp_todo/widgets/task-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({Key key}) : super(key: key);

  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  String searchingTitle;

  @override
  Widget build(BuildContext context) {
    return Consumer3<TaskData, ProjectData, DayData>(builder: (context, taskData, projectData, dayData, child){
      return Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 65,
                height: 70,
                color: Color(0xFF55a3d6),
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: TextField(
                  maxLength: 100,
                  autofocus: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    counterText: "",
                    fillColor: Theme.of(context).primaryColor,
                    hintText: "Search",
                    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF55a3d6), width: 3),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF55a3d6)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                  style: TextStyle(fontSize: 20.0),
                  cursorHeight: 20.0,
                  onChanged: (value) {
                    searchingTitle = value;
                  },
                ),
              ),
              Expanded(
                  child: Container(
                    color: Color(0xFF55a3d6),
                    height: 70,
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.search, color: Theme.of(context).primaryColor,)),
                  ))
            ],
          ),
        ],
      );
    });
  }
}
