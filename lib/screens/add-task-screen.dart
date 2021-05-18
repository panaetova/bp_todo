import 'package:bp_todo/domain/label-data.dart';
import 'package:bp_todo/domain/label.dart';
import 'package:bp_todo/domain/priority-choices.dart';
import 'package:bp_todo/domain/project-data.dart';
import 'package:bp_todo/domain/project.dart';
import 'package:bp_todo/domain/task-data.dart';
import 'package:bp_todo/domain/task.dart';
import 'package:bp_todo/screens/set-date-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle;
  String newTaskNotes;
  String dateTimeString = "No Date";
  DateTime dateTime;

  int newColor = 0xFFc1c8c7;

  List<Label> _labels = [];

  Priority _priority = Priority(
      priorityName: "Priority 4",
      iconData: Icons.flag,
      color: 0xFFc1c8c7,
      id: 4);

  @override
  Widget build(BuildContext context) {
    return Consumer2<LabelData, ProjectData>(
        builder: (BuildContext context, labelData, projectData, Widget child) {
      return Container(
        color: Color(0xFF737373),
        height: 180,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    maxLength: 40,
                    decoration: InputDecoration(hintText: "Buy coffee"),
                    style: TextStyle(fontSize: 20.0),
                    cursorHeight: 20.0,
                    onChanged: (newTitle) {
                      newTaskTitle = newTitle;
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Row(
                              children: [
                                Icon(Icons.inbox,
                                    color: Colors.blueAccent, size: 18),
                                SizedBox(
                                  width: 3,
                                ),
                                Text('INBOX',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueAccent)),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFFdddddd),
                              width: 2,
                            ),
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return Container(
                                    color: Color(0xFF737373),
                                    height: 300,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListView.builder(
                                            itemCount: projectData.projects.length,
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                             Project project = projectData.projects[index];
                                          return Container(
                                                 height: 60,
                                                 margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                              decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [BoxShadow(
                                              color: Colors.black.withOpacity(0.03),
                                              offset: Offset(0,9),
                                              blurRadius: 20,
                                              spreadRadius: 1,
                                              )],
                                              ),
                                          child: InkWell(
                                            onTap: (){
                                            },
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                                    height: 15,
                                                    width: 15,
                                                    decoration: BoxDecoration(
                                                      color: Color(project.color),
                                                      shape: BoxShape.circle,
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(project.title??"null", style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  )),
                                                ),
                                                Expanded(child: Container()),
                                                Container(
                                                  height: 50,
                                                  width: 5,
                                                  color: Color(project.color),
                                                )
                                              ],
                                            ),
                                          ));
                                        }),
                                      ),
                                    ));
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SetDateScreen(
                              receiveData: (setDateTimeString, setDateTime) {
                                setState(() {
                                  dateTimeString = setDateTimeString;
                                  dateTime = setDateTime;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.green,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(dateTimeString,
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFFdddddd),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      PopupMenuButton(
                        onSelected: choiceActionLabel,
                        itemBuilder: (context) {
                          return labelData.labels.map((Label label) {
                            return PopupMenuItem(
                                value: label,
                                child: CheckboxListTile(
                                    secondary: Icon(Icons.style_outlined),
                                    title: Text(label.title),
                                    activeColor: Color(newColor),
                                    value: label.isChecked,
                                    onChanged: (bool value) {
                                      setState(() {
                                        label.isChecked = value;
                                        if (value) {
                                          _labels.add(label);
                                        } else
                                          _labels.remove(label);
                                      });
                                    }));
                          }).toList();
                        },
                        icon: Icon(
                          Icons.label_outline,
                          color: _labels.isNotEmpty
                              ? Color(newColor)
                              : Colors.grey,
                        ),
                      ),
                      PopupMenuButton(
                        onSelected: choiceActionPriority,
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
                          color: Color(newColor),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.message_outlined,
                          color: newTaskNotes != null
                              ? Color(newColor)
                              : Colors.grey,
                        ),
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              String note;
                              return AlertDialog(
                                title: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Notes"),
                                    IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        })
                                  ],
                                )),
                                content: Container(
                                  height: 300,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Address of coffee shop",
                                        border: InputBorder.none),
                                    maxLines: null,
                                    expands: true,
                                    style: TextStyle(fontSize: 15.0),
                                    cursorHeight: 20.0,
                                    onChanged: (newNote) {
                                      note = newNote;
                                    },
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      "Add Note",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onPressed: () {
                                      newTaskNotes = note;
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          if (newTaskTitle != null) {
                            Task task = Task(title: newTaskTitle, priority: _priority, dateTime: dateTime);
                            if (newTaskNotes != null) {
                              task.notes.add(newTaskNotes);
                            }
                            _labels = _labels.toSet().toList();
                            task.labels = _labels;
                            Provider.of<TaskData>(context, listen: false)
                                .addTask(task);
                            for (final Label label in _labels) {
                              label.tasks.add(task);
                            }
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  )
                ],
              )),
        ),
      );
    });
  }

  void choiceActionLabel(Label label) {
    _labels.add(label);
    _labels = _labels.toSet().toList();
  }

  void choiceActionPriority(Priority priority) {
    _priority = priority;
    setState(() {
      newColor = priority.color;
    });
  }

  // ignore: missing_return
  int changeColor(int colorFlag) {
    switch (colorFlag) {
      case 0xFFfe7968:
        return 0xFFfe7968;
      case 0xFFe8a628:
        return 0xFFe8a628;
      case 0xFFfddca5:
        return 0xFFfddca5;
      case 0xFFc1c8c7:
        return 0xFFc1c8c7;
    }
  }
}
