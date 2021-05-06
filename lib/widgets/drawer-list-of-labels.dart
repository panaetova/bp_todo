import 'package:bp_todo/domain/label-data.dart';
import 'package:bp_todo/domain/label.dart';
import 'package:bp_todo/screens/label-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class DrawerListOfLabels extends StatefulWidget {
  @override
  _DrawerListOfLabelsState createState() => _DrawerListOfLabelsState();
}

class _DrawerListOfLabelsState extends State<DrawerListOfLabels> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LabelData>(
      builder: (BuildContext context, labelData, Widget child) {
        return Column(
          children: labelsList(labelData).toList(),
        );
      },);
  }

  Iterable<Widget> labelsList(LabelData labelData) sync* {
    for (final Label label in labelData.labels) {
      yield Slidable(
        actionPane: SlidableBehindActionPane(),
        actionExtentRatio: 0.2,
        secondaryActions: <Widget> [
          IconSlideAction(
              color: Colors.grey,
              icon: Icons.delete,
              onTap: () {
                setState(() {
                  labelData.deleteLabel(label);
                });
              })
        ],
        child: Container(
            height: 30,
            margin: EdgeInsets.only(left: 10, top: 3, bottom: 3),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LabelScreen(label: label)
              )),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(Icons.tag, color: Colors.grey, size: 20)),
                  Text(label.title,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      )),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(label.tasks.length.toString(), style: TextStyle(fontSize: 12),),
                  ),
                  Container(
                    width: 7,
                    color: Colors.grey,
                  )
                ],
              ),
            )),
      );
    }
  }
}
