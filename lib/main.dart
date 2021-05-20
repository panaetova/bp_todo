import 'package:bp_todo/domain/label-data.dart';
import 'package:bp_todo/domain/project-data.dart';
import 'package:bp_todo/domain/task-data.dart';
import 'package:bp_todo/screens/home-page.dart';
import 'package:bp_todo/screens/authentication.dart';
import 'package:bp_todo/screens/login-page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskData()),
        ChangeNotifierProvider(create: (context) => ProjectData()),
        ChangeNotifierProvider(create: (context) => LabelData()),
      ],
      child: MaterialApp(
        title: 'ToDo App',
        theme: ThemeData(
          primaryColor: Color(0xFFf6f5f5),
          fontFamily: 'avenir',
        ),
        home: Authentication(),
      ),
    );
  }
}
