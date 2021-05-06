import 'package:bp_todo/domain/project-data.dart';
import 'package:bp_todo/domain/project.dart';
import 'package:bp_todo/screens/project-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class DrawerListOfProjects extends StatefulWidget {
  @override
  _DrawerListOfProjectsState createState() => _DrawerListOfProjectsState();
}

class _DrawerListOfProjectsState extends State<DrawerListOfProjects> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectData>(
      builder: (BuildContext context, projectData, Widget child) {
        return Column(
          children: projectList(projectData).toList(),
        );
      },
    );
  }

  Iterable<Widget> projectList(ProjectData projectData) sync* {
    for (final Project project in projectData.projects) {
      yield Slidable(
        actionPane: SlidableBehindActionPane(),
        actionExtentRatio: 0.2,
        secondaryActions: <Widget>[
          IconSlideAction(
              color: Colors.grey,
              icon: Icons.delete,
              onTap: () {
                setState(() {
                  projectData.deleteProject(project);
                });
              })
        ],
        child: Container(
            height: 30,
            margin: EdgeInsets.only(left: 10, top: 3, bottom: 3),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ProjectScreen(project: project)
              )),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        color: Color(project.color),
                        shape: BoxShape.circle,
                      )),
                  Text(project.title,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      )),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(project.sections.length.toString(), style: TextStyle(fontSize: 12),),
                  ),
                  Container(
                    width: 7,
                    color: Color(project.color),
                  )
                ],
              ),
            )),
      );
    }
  }
}
