import 'package:bp_todo/domain/label-data.dart';
import 'package:bp_todo/domain/label.dart';
import 'package:bp_todo/domain/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LabelsBody extends StatefulWidget {
  final Task task;

  const LabelsBody({Key key, this.task}) : super(key: key);

  @override
  _LabelsBodyState createState() => _LabelsBodyState(task);
}

class _LabelsBodyState extends State<LabelsBody> {
  Task task;
  bool selectLabel = true;
  List<Label> updatedLabels = [];

  _LabelsBodyState(this.task);

  @override
  Widget build(BuildContext context) {
    return Consumer<LabelData> (builder: (context, labelData, child) {
      return selectLabel ?
      Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          children: [
            TextButton(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.style,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Select label",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  selectLabel = !selectLabel;
                });
              },
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10.0,
              children: labelsList(task, labelData).toList(),
            ),
          ],
        ),
      ),
    ))
    : Expanded(child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select Labels", style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),),
                TextButton(
                    onPressed: () {
                      setState(() {
                        task.updateLabels();
                        selectLabel = !selectLabel;
                      });
                    },
                    child: Text("Done", style: TextStyle(color: Color(task.priority.color), fontSize: 14),)),
              ],
            ),
            ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: labelData.labels.length,
                itemBuilder: (context, index) {
                  Label label = labelData.labels[index];
                  return CheckboxListTile(
                      secondary: Icon(Icons.style_outlined, color: Color(label.color),),
                      title: Text(label.title),
                      activeColor: Color(task.priority.color),
                      value: label.isChecked,
                      onChanged: (bool value){
                        setState(() {
                          label.isChecked = value;
                          if (value) {
                            task.labels.add(label);
                            label.tasks.add(task);
                          } else {
                            task.labels.remove(label);
                            label.tasks.remove(task);
                          }
                        });
                      });
                }
            )
          ],
        ),
      ),
    ));
  });
  }

  Iterable<Widget> labelsList(Task task, LabelData labelData) sync* {
    for (final Label label in task.labels) {
      yield Chip(
        label: Text(label.title),
        backgroundColor: Color(label.color),
        onDeleted: () {
          setState(() {
            task.labels
                .removeWhere((Label entry) => entry.title == label.title);
            labelData.labels.elementAt(labelData.labels.indexOf(label)).isChecked = false;
          });
        },
      );
    }
  }

}
