import 'package:bp_todo/domain/project.dart';
import 'package:bp_todo/screens/add-section-screen.dart';
import 'package:bp_todo/screens/add-task-screen.dart';
import 'package:bp_todo/widgets/section-body.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  final Project project;
  ProjectScreen({Key key, @required this.project}) : super(key: key);

  @override
  _ProjectScreenState createState() => _ProjectScreenState(project);
}

class _ProjectScreenState extends State<ProjectScreen> {
  Project project;
  _ProjectScreenState(this.project);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          title: Text(project.title, style: TextStyle(color: Colors.white),),
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Color(0xFF55a3d6),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => AddNewSectionScreen(project: project,));
              },),
            IconButton(
              icon: Icon(Icons.more_horiz_outlined),
              color: Colors.white,
              onPressed: (){},
            ),
          ]),
      body: SectionBody(project: project,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2c6992),
          splashColor: Color(0xFF4690c1),
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            // showModalBottomSheet(
            //   context: context,
            //   isScrollControlled: true,
            //   builder: (context) => AddTaskScreen(),
            // );
          },
          ),

    );
  }

}
