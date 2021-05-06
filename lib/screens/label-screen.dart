import 'package:bp_todo/domain/label.dart';
import 'package:bp_todo/domain/task-data.dart';
import 'package:bp_todo/widgets/task-body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LabelScreen extends StatefulWidget {
  final Label label;

  const LabelScreen({Key key, @required this.label}) : super(key: key);

  @override
  _LabelScreenState createState() => _LabelScreenState(label);
}

class _LabelScreenState extends State<LabelScreen> {
  Label label;
  _LabelScreenState(this.label);


  //возможно полностью переделать но пока хз как
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (BuildContext context, TaskData taskData, Widget child) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
            title: Text(label.title, style: TextStyle(color: Colors.white),),
            elevation: 0,
            backgroundColor: Color(0xFF55a3d6),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_horiz_outlined),
                color: Colors.white,
                onPressed: (){},
              ),
            ]),
        body: TaskBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF2c6992),
            splashColor: Color(0xFF4690c1),
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {}
        ),

      );}
    );
  }
}
