import 'package:bp_todo/domain/label-data.dart';
import 'package:bp_todo/domain/project-data.dart';
import 'package:bp_todo/domain/task-data.dart';
import 'package:bp_todo/screens/authentication.dart';
import 'package:bp_todo/services/auth-services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
              print(snapshot.error);
            return ErrorWidget();
          } else if (snapshot.hasData) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) => TaskData()),
                ChangeNotifierProvider(create: (context) => ProjectData()),
                ChangeNotifierProvider(create: (context) => LabelData()),
                ChangeNotifierProvider<AuthServices>.value(
                  value: AuthServices(),
                ),
                StreamProvider<User>.value(
                    value: AuthServices().user, initialData: null),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ToDo App',
                theme: ThemeData(
                  primaryColor: Color(0xFFf6f5f5),
                  fontFamily: 'avenir',
                ),
                home: Authentication(),
              ),
            );
          } else
            return Loading();
        });
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error),
              Text("Oops. Something went wrong!")
            ],
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

