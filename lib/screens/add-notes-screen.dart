import 'package:bp_todo/domain/task-data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNotesScreen extends StatelessWidget {
  String newNote;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            title: Center(child: Text("Notes")),
            content: Container(
              height: 300,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,),
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
                onChanged: (note) {
                  newNote = note;
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(newNote);
                  },
                  child: Text("Add Note", style: TextStyle(fontSize: 18),)),
            ],
          );
  }
}
