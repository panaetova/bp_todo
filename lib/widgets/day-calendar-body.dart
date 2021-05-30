import 'package:bp_todo/domain/day-data.dart';
import 'package:bp_todo/domain/day.dart';
import 'package:bp_todo/domain/task-data.dart';
import 'package:bp_todo/domain/task.dart';
import 'package:bp_todo/screens/data-task-screen.dart';
import 'package:bp_todo/widgets/task-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayCalendarBody extends StatefulWidget {
  final Day day;
  const DayCalendarBody({Key key, @required this.day}) : super(key: key);

  @override
  _DayCalendarBodyState createState() => _DayCalendarBodyState(day);
}

class _DayCalendarBodyState extends State<DayCalendarBody> {
  Day day;
  _DayCalendarBodyState(this.day);

  @override
  Widget build(BuildContext context) {
    return Consumer2<TaskData, DayData>(builder: (context, taskData, dayData, child) {
      return Column(children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: day.tasksPriority1.length,
          itemBuilder: (context, index) {
            Task task = day.tasksPriority1[index];
            return TaskWidget(
              taskTitle: task.title,
              isChecked: task.isDone,
              deletingTask: () {
                day.deleteTask(task);
                taskData.deleteTask(task, dayData);
              },
              //сделать анимацию ?? удаления
              pressDoneTask: () {
                day.deleteTask(task);
                taskData.deleteTask(task, dayData);
              },
              pressForData: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => DataTaskScreen(
                          task: task,
                          taskData: taskData,
                          dayData: dayData,
                        ));
              },
              priority: task.priority, labels: task.labels,
              dateTimeString: task.dateTimeString,
            );
          },
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: day.tasksPriority2.length,
          itemBuilder: (context, index) {
            Task task = day.tasksPriority2[index];
            return TaskWidget(
              taskTitle: task.title,
              isChecked: task.isDone,
              deletingTask: () {
                day.deleteTask(task);
                taskData.deleteTask(task, dayData);
              },
              //сделать анимацию ?? удаления
              pressDoneTask: () {
                day.deleteTask(task);
                taskData.deleteTask(task, dayData);
              },
              pressForData: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => DataTaskScreen(
                      task: task,
                      taskData: taskData,
                      dayData: dayData,
                    ));
              },
              priority: task.priority, labels: task.labels,
              dateTimeString: task.dateTimeString,
            );
          },
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: day.tasksPriority3.length,
          itemBuilder: (context, index) {
            Task task = day.tasksPriority3[index];
            return TaskWidget(
              taskTitle: task.title,
              isChecked: task.isDone,
              deletingTask: () {
                day.deleteTask(task);
                taskData.deleteTask(task, dayData);
              },
              //сделать анимацию ?? удаления
              pressDoneTask: () {
                day.deleteTask(task);
                taskData.deleteTask(task, dayData);
              },
              pressForData: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => DataTaskScreen(
                      task: task,
                      taskData: taskData,
                      dayData: dayData,
                    ));
              },
              priority: task.priority, labels: task.labels,
              dateTimeString: task.dateTimeString,
            );
          },
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: day.tasksDefault.length,
          itemBuilder: (context, index) {
            Task task = day.tasksDefault[index];
            return TaskWidget(
              taskTitle: task.title,
              isChecked: task.isDone,
              deletingTask: () {
                day.deleteTask(task);
                taskData.deleteTask(task, dayData);
              },
              //сделать анимацию ?? удаления
              pressDoneTask: () {
                day.deleteTask(task);
                taskData.deleteTask(task, dayData);
              },
              pressForData: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => DataTaskScreen(
                      task: task,
                      taskData: taskData,
                      dayData: dayData,
                    ));
              },
              priority: task.priority, labels: task.labels,
              dateTimeString: task.dateTimeString,
            );
          },
        ),
      ]);
    });
  }
}
