import 'package:bp_todo/domain/task.dart';
import 'package:bp_todo/widgets/add-button-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SubTasksBody extends StatefulWidget {
  final Task task;

  SubTasksBody({Key key, @required this.task}) : super(key: key);

  @override
  _SubTasksBodyState createState() => _SubTasksBodyState(task);
}

class _SubTasksBodyState extends State<SubTasksBody> {
  Task task;
  bool isChecked = false;
  String newSubtask;
  _SubTasksBodyState(this.task);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.task.subtasks.length,
                        itemBuilder: (context, index) {
                          String subtaskTitle = widget.task.subtasks[index];
                          return Slidable(
                            actionPane: SlidableBehindActionPane(),
                            actionExtentRatio: 0.3,
                            secondaryActions: <Widget>[
                              Container(
                                height: 35,
                                child: IconSlideAction(
                                  color: Color(task.priority.color),
                                  icon: Icons.delete,
                                  onTap: () {
                                    setState(() {
                                      widget.task.subtasks.removeAt(index);
                                    });
                                  },
                                ),
                              )
                            ],
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.03),
                                      offset: Offset(0, 9),
                                      blurRadius: 20,
                                      spreadRadius: 1,
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                        task.subtasks.removeAt(index);
                                        task.finishedSubtasks.add(subtaskTitle);
                                      });
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.grey, width: 2)),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 110,
                                    child: Text(subtaskTitle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        )),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    height: 35,
                                    width: 7,
                                    color: Color(task.priority.color),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    TextButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Add sub-task", style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                        onPressed: () {
                          showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                                color: Color(0xFF737373),
                                height: 80,
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
                                    child: Row(
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
                                              newSubtask = value;
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.send,
                                              color: Colors.redAccent,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if(newSubtask!= null) {
                                                  task.subtasks.add(newSubtask);
                                                  Navigator.of(context).pop();
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          });
                    }),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.task.finishedSubtasks.length,
                        itemBuilder: (context, index) {
                          String subtaskTitle =
                              widget.task.finishedSubtasks[index];
                          return Slidable(
                            actionPane: SlidableBehindActionPane(),
                            actionExtentRatio: 0.3,
                            secondaryActions: <Widget>[
                              Container(
                                height: 35,
                                child: IconSlideAction(
                                  color: Color(task.priority.color),
                                  icon: Icons.delete,
                                  onTap: () {
                                    setState(() {
                                      widget.task.finishedSubtasks
                                          .removeAt(index);
                                    });
                                  },
                                ),
                              )
                            ],
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.03),
                                      offset: Offset(0, 9),
                                      blurRadius: 20,
                                      spreadRadius: 1,
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                        task.finishedSubtasks.removeAt(index);
                                        task.subtasks.add(subtaskTitle);
                                      });
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      height: 20,
                                      width: 20,
                                      child: Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 110,
                                    child: Text(subtaskTitle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        )),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    height: 35,
                                    width: 7,
                                    color: Color(task.priority.color),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
