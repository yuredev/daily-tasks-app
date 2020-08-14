import 'package:daily_tasks_app/models/task.dart';
import 'package:daily_tasks_app/utils.dart';
import 'package:flutter/material.dart';

class DaySelector extends StatelessWidget {
  final List<Task> allTasks;

  DaySelector(this.allTasks);

  List<List<Task>> get taskListByDay {
    return List.generate(20, (i) {
      DateTime currentDay = DateTime.now().add(Duration(days: i));
      var currentDayTasks = this
          .allTasks
          .where((t) => Utils.compareDates(t.date, currentDay))
          .toList();
      return currentDayTasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: taskListByDay.length,
      itemBuilder: (ctx, index) => Text('Yure'),
    );
  }
}
