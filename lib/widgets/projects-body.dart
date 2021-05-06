import 'package:bp_todo/domain/project-data.dart';
import 'package:bp_todo/domain/project.dart';
import 'package:bp_todo/screens/project-screen.dart';
import 'package:bp_todo/widgets/project-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectData>(builder: (context, projectData, child) {
      return ListView.builder(
          itemCount: projectData.projectQuantity,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Project project = projectData.projects[index];
            return ProjectWidget(
              title: project.title,
              color: projectData.projects[index].color,
              deletingProject: () {
                projectData.deleteProject(project);
              },
              pressForData: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ProjectScreen(project: project)
                ));
              },
            );
          });
    });
  }
}
