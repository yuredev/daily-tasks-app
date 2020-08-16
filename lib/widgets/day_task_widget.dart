import 'package:daily_tasks_app/models/task.dart';
import 'package:daily_tasks_app/widgets/task_details.dart';
import 'package:flutter/material.dart';

class DayTaskWidget extends StatelessWidget {
  final Task task;
  final void Function(Task, bool) onTaskCheck;

  DayTaskWidget({
    this.task,
    this.onTaskCheck,
  });

  void _openTaskDetails(BuildContext context) {
    showModalBottomSheet(context: context, builder: (ctx) => TaskDetails(
      title: this.task.title,
      description: this.task.description,
      wasFinished: this.task.wasFinished,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      elevation: 5,
      child: GestureDetector(
        onTap: () => onTaskCheck(task, !task.wasFinished),
        child: ListTile(
          leading: IconButton(
            icon: Icon(Icons.assignment),
            onPressed: () => this._openTaskDetails(context),
          ),
          title: Text(task.title),
          trailing: Checkbox(
            value: task.wasFinished,
            onChanged: (newBool) => onTaskCheck(task, newBool),
          ),
        ),
      ),
    );
  }
}
