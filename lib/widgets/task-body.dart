import 'package:bp_todo/domain/task-data.dart';
import 'package:bp_todo/domain/task.dart';
import 'package:bp_todo/screens/data-task-screen.dart';
import 'package:bp_todo/widgets/task-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (BuildContext context, TaskData taskData, Widget child) {
      return Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: taskData.tasksPriority1.length,
            itemBuilder: (context, index) {
              Task task = taskData.tasksPriority1[index];
              return TaskWidget(
                taskTitle: task.title,
                isChecked: task.isDone,
                deletingTask: () {
                  taskData.deleteTask(task);
                },
                //сделать анимацию ?? удаления
                pressDoneTask: () {
                  taskData.updateTask(task);
                  taskData.deleteTask(task);
                },
                pressForData: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => DataTaskScreen(task: task, taskData: taskData,));
                },
                priority: task.priority, labels: task.labels, dateTimeString: task.dateTimeString,
              );
            },
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: taskData.tasksPriority2.length,
            itemBuilder: (context, index) {
              Task task = taskData.tasksPriority2[index];
              return TaskWidget(
                taskTitle: task.title,
                isChecked: task.isDone,
                deletingTask: () {
                  taskData.deleteTask(task);
                },
                //сделать анимацию ?? удаления
                pressDoneTask: () {
                  taskData.updateTask(task);
                  taskData.deleteTask(task);
                },
                pressForData: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => DataTaskScreen(task: task, taskData: taskData,));
                },
                priority: task.priority, labels: task.labels, dateTimeString: task.dateTimeString,
              );
            },
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: taskData.tasksPriority3.length,
            itemBuilder: (context, index) {
              Task task = taskData.tasksPriority3[index];
              return TaskWidget(
                taskTitle: task.title,
                isChecked: task.isDone,
                deletingTask: () {
                  taskData.deleteTask(task);
                },
                //сделать анимацию ?? удаления
                pressDoneTask: () {
                  taskData.updateTask(task);
                  taskData.deleteTask(task);
                },
                pressForData: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => DataTaskScreen(task: task, taskData: taskData,));
                },
                priority: task.priority, labels: task.labels, dateTimeString: task.dateTimeString,
              );
            },
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: taskData.tasksDefault.length,
            itemBuilder: (context, index) {
              Task task = taskData.tasksDefault[index];
              return TaskWidget(
                taskTitle: task.title,
                isChecked: task.isDone,
                deletingTask: () {
                  taskData.deleteTask(task);
                },
                //сделать анимацию ?? удаления
                pressDoneTask: () {
                  taskData.updateTask(task);
                  taskData.deleteTask(task);
                },
                pressForData: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => DataTaskScreen(task: task, taskData: taskData,));
                },
                priority: task.priority, labels: task.labels, dateTimeString: task.dateTimeString,
              );
            },
          ),

        ],
      );
    });
  }
}
