import 'package:bp_todo/domain/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SectionWidget extends StatefulWidget {
  final String title;
  final bool isOpened;
  final Function deleteSection;
  final Function tapOnSection;
  final Project project;

  const SectionWidget({Key key, this.title, this.isOpened, this.deleteSection, this.tapOnSection, @required this.project}) : super(key: key);


  @override
  _SectionWidgetState createState() => _SectionWidgetState(title, tapOnSection, deleteSection, isOpened, project);
}

class _SectionWidgetState extends State<SectionWidget> {

  final String title;
  final bool isOpened;
  final Function deleteSection;
  final Function tapOnSection;
  final Project project;
  _SectionWidgetState(this.title, this.tapOnSection, this.deleteSection, this.isOpened, this.project);

  bool tapped = false;

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
            color: Color(project.color),
            icon: Icons.delete,
            onTap: deleteSection,
          ),
        )
      ],
      child: Column(
        children: [
          Container(
            height: 60,
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
              onTap: tapOnSection,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(title??"null", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                  ),
                  Expanded(child: Container()),
                  tapped ? Icon(Icons.keyboard_arrow_down, color: Color(project.color), size: 35,)
                  : Icon(Icons.keyboard_arrow_left, color: Color(project.color), size: 35,),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 5,
                    color: Color(project.color),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Color(project.color),
            height: 1,
          ),
        ],
      ),
    );
  }
}
