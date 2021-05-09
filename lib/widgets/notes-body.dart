import 'package:bp_todo/domain/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesBody extends StatefulWidget {
  final Task task;

  NotesBody({Key key, @required this.task}) : super(key: key);

  @override
  _NotesBodyState createState() => _NotesBodyState(task);
}

class _NotesBodyState extends State<NotesBody> {
  Task task;
  String newNote;
  _NotesBodyState(this.task);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            children: [
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
                      Text("Add note", style: TextStyle(color: Colors.grey),),
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
                                            newNote = value;
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
                                              if(newNote!= null) {
                                                task.notes.add(newNote);
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
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.task.notes.length,
                itemBuilder: (context, index) {
                  String note = widget.task.notes[index];
                  return Slidable(
                    actionPane: SlidableBehindActionPane(),
                    actionExtentRatio: 0.17,
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        color: Color(widget.task.priority.color),
                        icon: Icons.delete,
                        onTap: () {
                          setState(() {
                            widget.task.notes.removeAt(index);
                          });
                        },
                      ),
                      IconSlideAction(
                        color: Colors.lightGreen,
                        icon: Icons.edit,
                        onTap: (){},
                      )
                    ],
                    child: Container(
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 75,
                          child: Text(note,
                              maxLines: 100,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
