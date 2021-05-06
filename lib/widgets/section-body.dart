import 'package:bp_todo/domain/project-data.dart';
import 'package:bp_todo/domain/project.dart';
import 'package:bp_todo/domain/section.dart';
import 'package:bp_todo/widgets/section-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectionBody extends StatefulWidget {
  final Project project;
  SectionBody({Key key, @required this.project}) : super(key: key);

  @override
  _SectionBodyState createState() => _SectionBodyState(project);
}

class _SectionBodyState extends State<SectionBody> {
  Project project;
  bool isOpen = false;
  _SectionBodyState(this.project);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: project.sections.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: isOpen,
          itemBuilder: (context, index) {
            return SectionWidget(
              tapOnSection: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
              title: project.sections[index].title,
              isOpened: false,
              deleteSection: () {
                setState(() {
                  project.sections.remove(project.sections[index]);
                });
              },
              project: project,
            );
          });
  }
}
