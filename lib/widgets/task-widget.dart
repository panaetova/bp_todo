import 'package:bp_todo/domain/label.dart';
import 'package:bp_todo/domain/priority-choices.dart';
import 'package:bp_todo/widgets/label-in-task-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWidget extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function deletingTask;
  final Function pressDoneTask;
  final Function pressForData;
  final Priority priority;
  final List<Label> labels;

  TaskWidget(
      {this.isChecked,
      this.taskTitle,
      this.deletingTask,
      this.pressDoneTask,
      this.pressForData,
      Key key,
      @required this.priority,
      @required this.labels})
      : super(key: key);

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
            color: Color(priority.color),
            icon: Icons.delete,
            onTap: deletingTask,
          ),
        )
      ],
      child: Container(
        height: 60,
        margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1,
          )
        ]),
        child: InkWell(
          onTap: pressForData,
          child: Row(
            children: [
              InkWell(
                onTap: pressDoneTask,
                child: !isChecked
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color(priority.color), width: 4)),
                      )
                    : Transform.scale(
                        scale: 1.2,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Color(priority.color),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
              ),
              labels.isEmpty
                  ? Text(taskTitle,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(taskTitle,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                        LabelWidget(labels: labels)
                      ],
                    ),
              Expanded(child: Container()),
              Container(
                height: 50,
                width: 7,
                color: Color(priority.color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
