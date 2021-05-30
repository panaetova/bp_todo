import 'package:bp_todo/domain/day-data.dart';
import 'package:bp_todo/domain/priority-choices.dart';
import 'package:bp_todo/domain/task-data.dart';
import 'package:bp_todo/domain/task.dart';
import 'package:bp_todo/widgets/data-icon-header.dart';
import 'package:bp_todo/widgets/labels-body-in-data-task.dart';
import 'package:bp_todo/widgets/notes-body.dart';
import 'package:bp_todo/widgets/subtasks-body.dart';
import 'package:flutter/material.dart';

class DataTaskScreen extends StatefulWidget {
  final Task task;
  final TaskData taskData;
  final DayData dayData;

  DataTaskScreen({Key key, @required this.task, @required this.taskData, @required this.dayData}) : super(key: key);

  @override
  _DataTaskScreenState createState() => _DataTaskScreenState(task, taskData, dayData);
}

class _DataTaskScreenState extends State<DataTaskScreen> {
  Task task;
  TaskData taskData;
  DayData dayData;
  String newNote;
  int iconIndex = 0;

  _DataTaskScreenState(this.task, this.taskData, this.dayData);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      height: 600,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Name of Future Folder"),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color(task.priority.color), width: 4)),
              ),
              Text(widget.task.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  )),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 50,
                ),
                IconButton(
                  icon: Icon(
                    Icons.mediation_rounded,
                    color: task.subtasks.isNotEmpty
                        ? Color(task.priority.color)
                        : Colors.grey,
                    size: 22,
                  ),
                  onPressed: () {
                    onIconTaped(0);
                  },
                ),
                IconButton(
                  icon: task.notes.isNotEmpty
                      ? Icon(Icons.message_rounded, color: Color(task.priority.color))
                      : Icon(Icons.message_outlined,
                          color: Colors.grey),
                  onPressed: () {
                    onIconTaped(1);
                  },
                ),
                IconButton(
                  icon: task.labels.isNotEmpty
                      ? Icon(Icons.label,
                      color:  Color(task.priority.color))
                      :  Icon(Icons.label_outline,
                      color: Colors.grey),
                  onPressed: () {
                    onIconTaped(2);
                  },
                ),
                PopupMenuButton(
                  onSelected: choiceAction,
                  itemBuilder: (context) {
                    return menuPriority.map((Priority priority) {
                      return PopupMenuItem(
                          value: priority,
                          child: ListTile(
                            leading: Icon(
                              priority.iconData,
                              color: Color(priority.color),
                            ),
                            title: Text(priority.priorityName),
                          ));
                    }).toList();
                  },
                  icon: Icon(
                    Icons.flag,
                    color: Color(task.priority.color),
                  ),
                ),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.grey),
                  onPressed: () {},
                )
              ],
            ),
            Divider(
              color: Color(task.priority.color),
              height: 2,
              thickness: 2,
            ),
            DataTaskIconHeader(
              iconIndex: iconIndex,
            ),
            getIconBody(),
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget getIconBody() {
    if (iconIndex == 0) {
      /*
      sub-tasks
       */
      return SubTasksBody(task: task);
    } else if (iconIndex == 1) {
      /*
      notes
       */
      return NotesBody(task: task);
    } else if (iconIndex == 2) {
      return LabelsBody(task: task);
    }
  }

  void onIconTaped(int index) {
    setState(() {
      iconIndex = index;
    });
  }

  void choiceAction(Priority priority) {
    setState(() {
      taskData.deleteTask(task, dayData);
      task.priority = priority;
      taskData.addTask(task);
    });
  }
}
