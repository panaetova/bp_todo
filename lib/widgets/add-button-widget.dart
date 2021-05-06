import 'package:bp_todo/domain/task.dart';
import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final List<String> subtasks;
  final List<String> notes;

  const AddButton({Key key, this.subtasks, this.notes}) : super(key: key);
  @override
  _AddButtonState createState() => _AddButtonState(subtasks, notes);
}

class _AddButtonState extends State<AddButton> {
  List<String> subtasks;
  List<String> notes;
  _AddButtonState(this.subtasks, this.notes);

  String addData;

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 65,
                  child: TextField(
                    style: TextStyle(fontSize: 20.0),
                    cursorHeight: 20.0,
                    onChanged: (value) {
                      addData = value;
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
                        if (subtasks.isNotEmpty) {
                          subtasks.add(addData);
                          Navigator.of(context).pop();
                        }
                        print(notes);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
