import 'package:bp_todo/screens/project-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProjectWidget extends StatelessWidget {
  final String title;
  final Function deletingProject;
  final Function pressForData;
  final int color;

  ProjectWidget({this.title, this.deletingProject, this.pressForData, this.color});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.3,
      secondaryActions: <Widget>[
        Container(
          height: 50,
          child: IconSlideAction(
            caption: 'Delete',
            color: Color(color),
            icon: Icons.delete,
            onTap: deletingProject,
          ),
        )
      ],
      child: Container(
        height: 60,
        margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0,9),
              blurRadius: 20,
              spreadRadius: 1,
            )]
        ),
        child: InkWell(
          onTap: pressForData,
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Color(color),
                    shape: BoxShape.circle,
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(title??"null", style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
              ),
              Expanded(child: Container()),
              Container(
                height: 50,
                width: 5,
                color: Color(color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
